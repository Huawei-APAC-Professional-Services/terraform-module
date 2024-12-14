variable "agencies" {
  type = list(object({
    name                  = string
    description           = optional(string, null)
    delegated_domain_name = string
    duration              = optional(string, "FOREVER")
    project_role          = optional(map(string), {})
    domain_roles          = optional(list(string), null)
    all_resources_roles   = optional(list(string), null)
  }))
}