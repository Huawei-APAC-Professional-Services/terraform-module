resource "huaweicloud_er_vpc_attachment" "this" {
  count       = var.er_id == null ? 0 : 1
  instance_id = var.er_id
  vpc_id      = huaweicloud_vpc.this.id
  subnet_id   = huaweicloud_vpc_subnet.this[var.er_subnet_name].id

  name                   = var.er_attachment_name
  auto_create_vpc_routes = false
}


resource "huaweicloud_vpc_route" "er_routes" {
  for_each    = toset(var.vpc_routes_er)
  vpc_id      = huaweicloud_vpc.this.id
  destination = each.value
  type        = "er"
  nexthop     = var.er_id
  depends_on  = [huaweicloud_er_vpc_attachment.this]
}