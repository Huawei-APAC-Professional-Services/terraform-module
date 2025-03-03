resource "kubernetes_cluster_role_binding_v1" "this" {
  for_each = { for role in var.cluster_role_bindings : role.name => role }
  metadata {
    name = each.value["name"]
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = each.value["cluster_role_name"]
  }

  dynamic "subject" {
    for_each = each.value["bindings"]
    content {
      kind      = subject.value["kind"]
      name      = subject.value["name"]
      api_group = subject.value["api_group"]
    }
  }
}