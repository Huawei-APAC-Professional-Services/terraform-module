#resource "huaweicloud_cfw_lts_log" "this" {
#  for_each                     = { for config in var.var.log_config : config.lts_log_group_id => config }
#  fw_instance_id               = huaweicloud_cfw_firewall.this.id
#  lts_log_group_id             = each.value.lts_log_group_id
#  lts_attack_log_stream_enable = each.value.lts_attack_log_stream_id != null ? 1 : 0
#  lts_access_log_stream_enable = each.value.lts_access_log_stream_id != null ? 1 : 0
#  lts_flow_log_stream_enable   = each.value.lts_flow_log_stream_id != null ? 1 : 0
#  lts_attack_log_stream_id     = each.value.lts_attack_log_stream_id
#  lts_access_log_stream_id     = each.value.lts_access_log_stream_id
#  lts_flow_log_stream_id       = each.value.lts_flow_log_stream_id
#}