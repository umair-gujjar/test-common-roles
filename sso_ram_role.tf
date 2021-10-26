locals {
  sso_ram_role = [
    {
      role_name            = "AAD"
      description          = "Role for Azure AD"
      max_session_duration = 43200
      role_document        = <<EOL
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "RAM": [
          "acs:ram::5782132213214609:role/AADrole"
        ]
      }
    }
  ],
  "Version": "1"
}
EOL
      policy_attachments = [
        "AdministratorAccess"
      ]
      additional_policy = null
    }
  ]
}
