output "accounts" {
  value = { for account in huaweicloud_organizations_account.this : account.name => account.id }
}