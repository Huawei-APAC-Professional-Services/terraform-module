resource "huaweicloud_er_vpc_attachment" "this" {
  for_each               = { for attachment in var.var.attachments : attachment.name => attachment }
  instance_id            = huaweicloud_er_instance.this.id
  name                   = each.value.name
  description            = each.value.description
  vpc_id                 = each.value.vpc_id
  subnet_id              = each.value.subnet_id
  auto_create_vpc_routes = false
  tags                   = each.value.tags
}

resource "huaweicloud_er_association" "this" {
  for_each       = { for node in var.associations : node.attachment_name => node }
  instance_id    = huaweicloud_er_instance.this.id
  route_table_id = huaweicloud_er_route_table.this[each.value.route_table_name].id
  attachment_id  = huaweicloud_er_vpc_attachment.this[each.value.attachment_name].id
}

resource "huaweicloud_er_propagation" "this" {
  for_each       = { for node in var.associations : node.attachment_name => node }
  instance_id    = huaweicloud_er_instance.this.id
  route_table_id = huaweicloud_er_route_table.this[each.value.route_table_name].id
  attachment_id  = huaweicloud_er_vpc_attachment.this[each.value.attachment_name].id
  depends_on     = [huaweicloud_er_association.this]
}