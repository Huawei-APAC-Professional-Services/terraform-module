data "huaweicloud_account" "current" {}

resource "huaweicloud_rms_resource_recorder" "main" {
  agency_name = "rms_tracker_agency"

  selector {
    all_supported = true
  }

  obs_channel {
    bucket = var.hfa_config_bucket_name
    region = var.hfa_config_bucket_region
  }

  dynamic "smn_channel" {
    for_each = var.hfa_config_smn_topic
    content {
      topic_urn = smn_channel.value
      region    = smn_channel.key
    }
  }
}