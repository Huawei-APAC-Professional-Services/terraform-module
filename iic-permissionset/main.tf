locals {
  system_roles_display_name_set     = toset(var.system_roles_display_name)
  system_roles_name_set             = toset(var.system_roles_name)
  system_roles_display_name_set_ids = [for v in data.huaweicloud_identity_role.system_roles_display_name : v.id]
  system_roles_name_set_ids         = [for v in data.huaweicloud_identity_role.system_roles_name : v.id]
}

data "huaweicloud_identitycenter_instance" "this" {}

resource "huaweicloud_identitycenter_permission_set" "this" {
  instance_id      = data.huaweicloud_identitycenter_instance.this.id
  name             = var.permissionset_name
  session_duration = var.permission_session_duration
}

data "huaweicloud_identity_role" "system_roles_display_name" {
  for_each     = local.system_roles_display_name_set
  display_name = each.value
}

data "huaweicloud_identity_role" "system_roles_name" {
  for_each = local.system_roles_name_set
  name     = each.value
}

resource "huaweicloud_identitycenter_system_policy_attachment" "system_roles" {
  instance_id       = data.huaweicloud_identitycenter_instance.this.id
  permission_set_id = huaweicloud_identitycenter_permission_set.this.id
  policy_ids        = concat(local.system_roles_display_name_set_ids, local.system_roles_name_set_ids)
}

resource "huaweicloud_identitycenter_custom_policy_attachment" "policy" {
  count             = var.custom_policy == "" ? 0 : 1
  instance_id       = data.huaweicloud_identitycenter_instance.this.id
  permission_set_id = huaweicloud_identitycenter_permission_set.this.id
  custom_policy     = var.custom_policy
}

resource "huaweicloud_identitycenter_custom_role_attachment" "role" {
  count             = var.custom_role == "" ? 0 : 1
  instance_id       = data.huaweicloud_identitycenter_instance.this.id
  permission_set_id = huaweicloud_identitycenter_permission_set.this.id
  custom_role       = var.custom_role
}

