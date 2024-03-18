locals {
  organization_id = var.organization_id
}

data "huaweicloud_organizations_organization" "current" {}