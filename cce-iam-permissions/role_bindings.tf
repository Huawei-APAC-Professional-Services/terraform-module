resource "kubernetes_role_binding_v1" "this" {
  for_each = { for role in var.role_bindings : role.name => role }
  metadata {
    name      = each.value["name"]
    namespace = each.value["namespace"]
    annotations = {
      "CCE.com/IAM" = "true"
    }
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = each.value["role_name"]
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