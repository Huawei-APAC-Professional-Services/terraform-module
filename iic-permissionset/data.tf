data "huaweicloud_identitycenter_instance" "this" {}

data "huaweicloud_identity_permissions" "all_system_policies" {
  type = "system-policy"
}

locals {
  role_id_map = {for permission in data.huaweicloud_identity_permissions.permissions: permission.name => permission.id}
}