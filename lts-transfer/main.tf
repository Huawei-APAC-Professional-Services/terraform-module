resource "huaweicloud_lts_transfer" "this" {
  log_group_id = var.lts_group_id

  log_streams {
    log_stream_id = var.lts_stream_id
  }

  log_transfer_info {
    log_transfer_type   = var.log_transfer_type
    log_transfer_mode   = var.log_transfer_mode
    log_storage_format  = var.log_storage_format
    log_transfer_status = var.log_transfer_status

    dynamic "log_transfer_detail" {
      for_each = var.obs_transfer_config
      content {
        obs_period           = log_transfer_detail.value["obs_period"]
        obs_period_unit      = log_transfer_detail.value["obs_period_unit"]
        obs_bucket_name      = log_transfer_detail.value["obs_bucket_name"]
        obs_transfer_path    = log_transfer_detail.value["obs_transfer_path"]
        obs_dir_prefix_name  = log_transfer_detail.value["obs_dir_prefix_name"]
        obs_prefix_name      = log_transfer_detail.value["obs_prefix_name"]
        obs_eps_id           = log_transfer_detail.value["obs_eps_id"]
        obs_encrypted_enable = log_transfer_detail.value["obs_encrypted_enable"]
        obs_encrypted_id     = log_transfer_detail.value["obs_encrypted_id"]
        obs_time_zone        = log_transfer_detail.value["obs_time_zone"]
        obs_time_zone_id     = log_transfer_detail.value["obs_time_zone_id"]
      }
    }

    dynamic "log_transfer_detail" {
      for_each = var.dis_transfer_config
      content {
        dis_id   = log_transfer_detail.value["dis_id"]
        dis_name = log_transfer_detail.value["dis_name"]
      }
    }

    dynamic "log_transfer_detail" {
      for_each = var.kafka_transfer_config
      content {
        kafka_id    = log_transfer_detail.value["kafka_id"]
        kafka_topic = log_transfer_detail.value["kafka_topic"]
      }
    }

    dynamic "log_agency_transfer" {
      for_each = var.transfer_agency_config
      content {
        agency_domain_name = log_agency_transfer.value["agency_domain_name"]
        agency_domain_id   = log_agency_transfer.value["agency_domain_id"]
        agency_name        = log_agency_transfer.value["agency_name"]
        agency_project_id  = log_agency_transfer.value["agency_project_id"]
      }
    }
  }
}