resource "huaweicloud_er_flow_log" "this" {
  for_each       = { for flowlog in var.flowlog_config : flowlog.name => flowlog }
  instance_id    = huaweicloud_er_instance.this.id
  log_store_type = each.value.log_store_type
  log_group_id   = each.value.log_group_id
  log_stream_id  = each.value.log_stream_id
  resource_type  = each.value.resource_type
  resource_id    = huaweicloud_er_vpc_attachment.this[each.value.attachment_name].id
  name           = each.value.name
  description    = each.value.description
  enabled        = each.value.enabled
}