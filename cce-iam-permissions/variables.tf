variable "roles" {
  type = list(object({
    name = string
    rules = list(object({
      apiGroups = list(string)
      resources = list(string)
      verbs     = list(string)
    }))
  }))
}