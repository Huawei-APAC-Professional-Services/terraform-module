resource "huaweicloud_vpc" "this" {
  name                  = var.vpc_name
  cidr                  = var.vpc_cidr
  tags                  = merge(var.tags, var.vpc_tags)
  description           = var.vpc_description
  enterprise_project_id = var.enterprise_project_id
}

resource "huaweicloud_vpc_flow_log" "this" {
  count         = var.vpc_flowlog_enabled ? 1 : 0
  name          = var.vpc_flowlog_name != null ? var.vpc_flowlog_name : format("%s-%s", huaweicloud_vpc.this.name, "vpc-flowlog")
  resource_type = "vpc"
  resource_id   = huaweicloud_vpc.this.id
  traffic_type  = var.vpc_flow_log_traffic_type
  log_group_id  = var.vpc_flowlog_log_group_id
  log_stream_id = var.vpc_flowlog_log_stream_id
}
