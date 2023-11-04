data "huaweicloud_account" "current" {}

resource "huaweicloud_rms_resource_aggregation_authorization" "main" {
  count = var.hfa_security_account_id != data.huaweicloud_account.current.id ? 1:0
  account_id = var.hfa_security_account_id
}

resource "huaweicloud_rms_resource_aggregator" "main" {
  count = (var.hfa_security_account_id != data.huaweicloud_account.current.id) && (var.hfa_config_accounts_list != []) ? 0:1
  name        = var.hfa_config_aggregator_name
  type        = "ACCOUNT"
  account_ids = var.hfa_config_accounts_list
}