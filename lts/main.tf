resource "huaweicloud_lts_group" "this" {
  group_name  = var.group_name
  ttl_in_days = var.ttl_in_days
}

resource "huaweicloud_lts_stream" "this" {
  for_each    = { for stream in var.var.streams : stream.name => stream }
  group_id    = huaweicloud_lts_group.this.id
  stream_name = each.value.name
  ttl_in_days = each.value.ttl_in_days
  tags        = each.value.tags
}