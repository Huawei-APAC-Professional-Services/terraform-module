variable "cluster_roles" {
  type = list(object({
    name = string
    rules = list(object({
      apiGroups = list(string)
      resources = list(string)
      verbs     = list(string)
    }))
  }))
  default = []
}

variable "cluster_role_bindings" {
  type = list(object({
    name              = string
    cluster_role_name = string
    bindings = list(object({
      kind      = optional(string, "User")
      name      = string
      api_group = optional(string, "rbac.authorization.k8s.io")
    }))
  }))
  default = []
}

variable "roles" {
  type = list(object({
    name      = string
    namespace = optional(string, "default")
    rules = list(object({
      apiGroups = list(string)
      resources = list(string)
      verbs     = list(string)
    }))
  }))
  default = []
}

variable "role_bindings" {
  type = list(object({
    name      = string
    namespace = optional(string, "default")
    role_name = string
    bindings = list(object({
      kind      = optional(string, "User")
      name      = string
      api_group = optional(string, "rbac.authorization.k8s.io")
    }))
  }))
  default = []
}