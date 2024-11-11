variable "accounts" {
  type = list(object({
    name        = string
    email       = optional(string, null)
    phone       = optional(string, null)
    agency_name = optional(string, "OrganizationAccountAccessAgency")
    ou_id       = optional(string, null)
    tags        = optional(map(string), {})
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}