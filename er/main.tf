data "huaweicloud_er_availability_zones" "this" {}

resource "huaweicloud_er_instance" "this" {
  name                           = var.name
  availability_zones             = slice(data.huaweicloud_er_availability_zones.this.names, 0, 1)
  asn                            = var.asn
  enable_default_propagation     = false
  enable_default_association     = false
  auto_accept_shared_attachments = var.auto_accept_shared_attachments
  description                    = var.description
  tags                           = var.tags
}

#resource "huaweicloud_er_vpc_attachment" "this" {
#  for_each    = var.attachments
#  instance_id = huaweicloud_er_instance.this.id
#  vpc_id      = each.value.vpc_id
#  subnet_id   = each.value.subnet_id
#
#  name                   = each.value.name
#  auto_create_vpc_routes = each.value.auto_create_vpc_routes
#
#  tags = each.value.tags
#}
#
#resource "huaweicloud_er_route_table" "this" {
#  for_each = var.route_tables
#  instance_id = huaweicloud_er_instance.this.id
#  name        = each.value.name
#  description = each.value.description
#
#  tags = each.value.tags
#}