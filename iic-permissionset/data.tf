data "huaweicloud_identitycenter_instance" "this" {}

data "huaweicloud_identity_permissions" "all_system_policies" {
  type = "system-policy"
}

locals {
  policies = { for policy in data.huaweicloud_identity_permissions.all_system_policies.permissions : policy.name => policy.id }
}

