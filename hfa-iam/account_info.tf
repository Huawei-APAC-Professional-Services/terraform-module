data "huaweicloud_account" "hfa_account" {}

output "hfa_account_id" {
  value = data.huaweicloud_account.hfa_account.id
}