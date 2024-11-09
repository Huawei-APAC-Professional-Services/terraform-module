output "lts_group_id" {
  value = var.cts_lts_enabled ? data.huaweicloud_cts_trackers.system.trackers[0].group_id : null
}

output "lts_stream_id" {
  value = var.cts_lts_enabled ? data.huaweicloud_cts_trackers.system.trackers[0].stream_id : null
}