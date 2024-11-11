resource "huaweicloud_css_logstash_configuration" "this" {
  for_each     = { for config in var.logstash_config : config.name => config }
  cluster_id   = huaweicloud_css_logstash_cluster.this.id
  name         = each.value.name
  conf_content = each.value.conf_content

  setting {
    workers                  = each.value.workers
    batch_size               = each.value.batch_size
    batch_delay_ms           = each.value.batch_delay_ms
    queue_type               = each.value.queue_type
    queue_check_point_writes = each.value.queue_check_point_writes
    queue_max_bytes_mb       = each.value.queue_max_bytes_mb
  }
}

resource "time_sleep" "wait_logstash_config_verification" {
  depends_on      = [huaweicloud_css_logstash_configuration.this]
  create_duration = "180s"
}

resource "huaweicloud_css_logstash_pipeline" "this" {
  cluster_id = huaweicloud_css_logstash_cluster.this.id
  names      = [for config in var.logstash_config : config.name]
  depends_on = [time_sleep.wait_logstash_config_verification]
}