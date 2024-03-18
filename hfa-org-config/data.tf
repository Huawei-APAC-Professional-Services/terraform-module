locals {
  organization_id = data.huaweicloud_organizations_organization.current.root_id
}

data "huaweicloud_organizations_organization" "current" {}