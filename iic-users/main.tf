data "huaweicloud_identitycenter_instance" "this" {}

data "huaweicloud_organizations_accounts" "this" {}

locals {
  account_info = { for account in data.data.huaweicloud_organizations_accounts.this.accounts : account.name => account.id }
}

resource "huaweicloud_identitycenter_user" "this" {
  for_each          = { for user in var.users : user.name => user }
  identity_store_id = data.huaweicloud_identitycenter_instance.this.identity_store_id
  user_name         = each.value.name
  password_mode     = "OTP"
  display_name      = each.value.display_name
  family_name       = each.value.family_name
  given_name        = each.value.given_name
  email             = each.value.email
}

resource "huaweicloud_identitycenter_account_assignment" "this" {
  for_each          = { for user in var.users : user.name => user }
  instance_id       = data.huaweicloud_identitycenter_instance.this.id
  permission_set_id = each.value.permissionset_id
  principal_id      = huaweicloud_identitycenter_user.this[each.key].id
  principal_type    = "USER"
  target_id         = local.account_info[each.value.account_name]
  target_type       = "ACCOUNT"
  depends_on        = [huaweicloud_identitycenter_user.this]
}

output "users" {
  value = { for user in huaweicloud_identitycenter_user.this : user.user_name => user.password_mode }
}