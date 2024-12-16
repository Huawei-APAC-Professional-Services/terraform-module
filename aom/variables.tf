variable "prometheus_instances" {
  type = list(object({
    name                  = string
    type                  = string
    enterprise_project_id = optional(string, "0")
    version               = optional(string, null)
  }))
}