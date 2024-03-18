locals {
  organization_id = data.huaweicloud_organizations_organization.current.id
}

data "huaweicloud_organizations_organization" "current" {}

output "org_id" {
  value = local.organization_id
}