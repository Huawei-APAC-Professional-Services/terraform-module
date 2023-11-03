data "huaweicloud_account" "hfa_account" {}

output "hfa_account_id" {
  value = data.huaweicloud_account.hfa_account.id
}

output "hfa_account_name" {
  value = data.huaweicloud_account.hfa_account.name
}