resource "huaweicloud_identity_agency" "this" {
  for_each              = { for agency in var.var.agencies : agency.name => agency }
  name                  = each.value["name"]
  description           = each.value["description"]
  delegated_domain_name = each.value["delegated_domain_name"]

  dynamic "project_role" {
    for_each = each.value["project_roles"]
    content {
      project = project_role.key
      roles   = project_role.value
    }
  }
  domain_roles        = each.value["domain_roles"]
  all_resources_roles = each.value["all_resources_roles"]
}