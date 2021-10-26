terraform {
  backend "oss" {}
}

provider "alicloud" {
  region = var.region
}

locals {
  ram_roles = concat(
    [],
    var.cluster_ram_roles ? local.cluster_ram_roles : [],
    var.sso_ram_role ? local.sso_ram_role : []
  )
  ram_role_policy_attachments = flatten([
    for role in local.ram_roles : [
      for policy in role.policy_attachments : {
        policy_name = policy
        role_name   = role.role_name
      }
    ]
  ])
  ram_role_additional_policies = flatten([
    for role in local.ram_roles : {
      role_name         = role.role_name
      additional_policy = role.additional_policy
    }
    if role.additional_policy != null
  ])
}

resource "alicloud_ram_role" "role" {
  for_each = {
    for ram_role in local.ram_roles : ram_role.role_name => ram_role
  }

  name                 = each.value.role_name
  document             = each.value.role_document
  description          = each.value.description
  max_session_duration = each.value.max_session_duration
  force                = true
}

resource "alicloud_ram_role_policy_attachment" "attach" {
  for_each = {
    for policy_attachment in local.ram_role_policy_attachments : "${policy_attachment.role_name}.${policy_attachment.policy_name}" => policy_attachment
  }

  policy_name = each.value.policy_name
  policy_type = "System"
  role_name   = each.value.role_name

  depends_on = [alicloud_ram_role.role]
}

resource "alicloud_ram_policy" "additional_policy" {
  for_each = {
    for additional_policy in local.ram_role_additional_policies : additional_policy.role_name => additional_policy
  }

  policy_name     = "${each.value.role_name}CustomPolicy"
  policy_document = each.value.additional_policy
  force           = true
}

resource "alicloud_ram_role_policy_attachment" "additional_policy_attachment" {
  for_each = {
    for additional_policy in local.ram_role_additional_policies : additional_policy.role_name => additional_policy
  }

  policy_name = "${each.value.role_name}CustomPolicy"
  policy_type = "Custom"
  role_name   = each.value.role_name

  depends_on = [alicloud_ram_role.role, alicloud_ram_policy.additional_policy]
}
