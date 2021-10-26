variable "region" {
  description = "AliCloud region where resources are provisioned"
  type        = string
  default     = "eu-central-1"
}

variable "cluster_ram_roles" {
  description = "Whether to create clustere RAM roles"
  type        = bool
}

variable "sso_ram_role" {
  description = "Whether to create SSO RAM role"
  type        = bool
}
