resource "huaweicloud_identitycenter_permission_set" "this" {
  for_each         = { for permissionset in var.permission_sets : permissionset.name => permissionset }
  instance_id      = data.huaweicloud_identitycenter_instance.this.id
  name             = each.value.name
  session_duration = each.value.session_duration
}
