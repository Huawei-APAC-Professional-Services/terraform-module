data "huaweicloud_account" "current" {}

resource "huaweicloud_rms_resource_aggregation_authorization" "main" {
  count = var.hfa_security_account_id != data.huaweicloud_account.current.id ? 1:0
  account_id = var.hfa_security_account_id
}