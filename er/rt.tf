resource "huaweicloud_er_route_table" "this" {
  for_each    = { for table in var.route_tables : table.name => table }
  instance_id = huaweicloud_er_instance.this.id
  name        = each.value.name
  description = each.value.description

  tags = each.value.tags
}