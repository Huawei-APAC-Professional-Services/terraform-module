data "huaweicloud_account" "current" {}

locals {
  config_member_accounts = var.hfa_config_aggregator_account_id == data.huaweicloud_account.current.id ? [for account in var.hfa_accounts_id_list: account if account != data.huaweicloud_account.current.id ] : var.hfa_accounts_id_list
}

resource "huaweicloud_rms_resource_aggregation_authorization" "main" {
  count      = var.hfa_config_aggregator_account_id == data.huaweicloud_account.current.id ? 0 : 1
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
  count       = var.hfa_config_aggregator_account_id == data.huaweicloud_account.current.id ? 1 : 0
  name        = var.hfa_config_aggregator_name
  type        = "ACCOUNT"
  account_ids = local.config_member_accounts
}