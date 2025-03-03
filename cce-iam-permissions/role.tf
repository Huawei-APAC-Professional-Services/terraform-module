resource "kubernetes_cluster_role_v1" "this" {
  for_each = { for role in var.roles : role.name => role }
  metadata {
    name = each.value["name"]
  }

  dynamic "rule" {
    for_each = each.value["rules"]
    content {
      api_groups = rule.value["apiGroups"]
      resources  = rule.value["resources"]
      verbs      = rule.value["verbs"]
    }
  }
}