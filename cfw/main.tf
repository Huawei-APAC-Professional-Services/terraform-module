resource "huaweicloud_cfw_firewall" "this" {
  name = var.name

  flavor {
    version          = var.flavor
    extend_vpc_count = var.extend_vpc_count
    extend_bandwidth = var.extend_bandwidth
    extend_eip_count = var.extend_eip_count
  }

  charging_mode = var.charging_mode
  period_unit   = var.period_unit
  period        = var.period
  auto_renew    = var.auto_renew_enabled

  east_west_firewall_inspection_cidr = var.cidr
  east_west_firewall_mode            = var.attach_mode
  east_west_firewall_er_id           = var.er_id
  east_west_firewall_status          = var.east_west_protection_enabled

  ips_switch_status   = var.ips_enabled
  ips_protection_mode = var.ips_mode

  tags = var.tags
}