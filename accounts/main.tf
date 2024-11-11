// Account
resource "huaweicloud_organizations_account" "this" {
  for_each    = { for account in var.var.accounts : account.name => account }
  name        = each.value.name
  email       = each.value.email
  phone       = each.value.phone
  agency_name = each.value.agency_name
  parent_id   = each.value.ou_id
  tags        = merge(var.tags, each.value.tags)
}