output "aad_ram_role_id" {
  value = var.sso_ram_role ? alicloud_ram_role.role["AAD"].role_id : null
}
