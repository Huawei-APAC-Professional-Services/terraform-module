data "huaweicloud_account" "current" {}

locals {
  is_aggregator_account = var.hfa_config_aggregator_account_id != null
}

resource "huaweicloud_rms_resource_aggregation_authorization" "main" {
  count      = local.is_aggregator_account ? 0 : 1
  account_id = var.hfa_config_aggregator_account_id
}

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

resource "huaweicloud_rms_resource_aggregator" "main" {
  count       = local.is_aggregator_account && var.hfa_config_member_account_ids != null ? 1 : 0
  name        = var.hfa_config_aggregator_name
  type        = "ACCOUNT"
  account_ids = var.hfa_accounts_id_list
}