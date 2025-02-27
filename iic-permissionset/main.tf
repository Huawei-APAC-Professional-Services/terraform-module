resource "huaweicloud_identitycenter_permission_set" "this" {
  for_each         = toset(var.permission_sets)
  instance_id      = data.huaweicloud_identitycenter_instance.this.id
  name             = each.value.name
  session_duration = each.value.session_duration
}
