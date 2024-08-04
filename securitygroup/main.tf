resource "huaweicloud_networking_secgroup" "this" {
  name                 = var.securitygroup_name
  delete_default_rules = var.delete_default_rules
}

resource "huaweicloud_networking_secgroup_rule" "this" {
  for_each                = { for rule in var.rules : rule.name => rule }
  security_group_id       = huaweicloud_networking_secgroup.this.id
  direction               = each.value.direction
  ethertype               = each.value.ethertype
  protocol                = each.value.protocol
  port_range_min          = each.value.port_range_min
  port_range_max          = each.value.port_range_max
  remote_ip_prefix        = each.value.remote_ip_prefix
  remote_address_group_id = each.value.remote_address_group_id
  remote_group_id         = each.value.remote_group_id
  ports                   = each.value.ports
  priority                = each.value.priority
  action                  = each.value.action
}