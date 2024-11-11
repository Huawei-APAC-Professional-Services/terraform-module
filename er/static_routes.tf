resource "huaweicloud_er_static_route" "this" {
  for_each       = { for route in var.static_routes : route.name => route }
  route_table_id = huaweicloud_er_route_table.this[each.value.route_table_name].id
  destination    = each.value.destination_cidr
  attachment_id  = each.value.attachment_name != null ? huaweicloud_er_vpc_attachment.this[each.value.attachment_name].id : null
  is_blackhole   = each.value.is_blackhole
}