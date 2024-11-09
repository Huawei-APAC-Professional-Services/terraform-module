resource "huaweicloud_vpc_subnet" "this" {
  for_each          = { for subnet in var.subnets : subnet.name => subnet }
  name              = each.value.name
  cidr              = each.value.cidr
  tags              = merge(var.tags, each.value.tags)
  gateway_ip        = cidrhost(each.value.cidr, 1)
  vpc_id            = huaweicloud_vpc.this.id
  availability_zone = each.value.availability_zone
  description       = each.value.description
}

resource "huaweicloud_vpc_flow_log" "subnet_flowlog" {
  for_each      = { for subnet in var.subnets : subnet.name => subnet if subnet.enable_vpc_flowlog }
  name          = "${each.value.name}-flowlog"
  resource_type = "network"
  resource_id   = huaweicloud_vpc_subnet.this[each.value.name].id
  traffic_type  = each.value.flowlog_traffic_type
  log_group_id  = each.value.flowlog_lts_group_id
  log_stream_id = each.value.flowlog_lts_stream_id
}