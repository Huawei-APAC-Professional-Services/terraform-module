################################################################################
# VPC
################################################################################
resource "huaweicloud_vpc" "this" {
  name                  = var.vpc_name
  cidr                  = var.vpc_cidr
  tags                  = merge(var.tags, var.vpc_tags)
  description           = var.vpc_description
  enterprise_project_id = var.enterprise_project_id
}

################################################################################
# Subnet
################################################################################
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

resource "huaweicloud_vpc_flow_log" "this" {
  count         = var.vpc_flowlog_enabled ? 1 : 0
  name          = var.vpc_flowlog_name != null ? var.vpc_flowlog_name : format("%s%s", huaweicloud_vpc.this.name, "flowlog")
  resource_type = "vpc"
  resource_id   = huaweicloud_vpc.this.id
  traffic_type  = "all"
  log_group_id  = var.log_group_id
  log_stream_id = var.log_stream_id
}
