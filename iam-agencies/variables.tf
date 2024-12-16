variable "service_agencies" {
  type = list(object({
    name                   = string
    description            = optional(string, null)
    delegated_service_name = string
    duration               = optional(string, "FOREVER")
    policy_names           = optional(list(string), null)
  }))
}

variable "account_agencies" {
  type = list(object({
    name                  = string
    description           = optional(string, null)
    delegated_domain_name = string
    duration              = optional(string, "FOREVER")
    project_roles         = optional(map(string), {})
    domain_roles          = optional(list(string), null)
    all_resources_roles   = optional(list(string), null)
  }))
  default = [{}]
}