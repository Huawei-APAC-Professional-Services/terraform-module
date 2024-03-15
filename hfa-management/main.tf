resource "huaweicloud_organizations_account" "huawei_cloud_account"{
  name  = var.account_name
  email = var.email_address
  agency_name = var.organization_agency_name
  parent_id = var.parent_id
}

output "account_id" {
  value = huaweicloud_organizations_account.huawei_cloud_account.id
}