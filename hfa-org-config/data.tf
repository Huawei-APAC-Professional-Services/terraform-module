locals {
  organization_id = data.huaweicloud_organizations_organization.current.id
}

data "huaweicloud_organizations_organization" "current" {}