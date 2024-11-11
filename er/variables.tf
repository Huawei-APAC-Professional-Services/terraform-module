variable "name" {
  type = string
}

variable "asn" {
  type    = number
  default = 64512
}

variable "enable_default_propagation" {
  type    = bool
  default = false
}

variable "enable_default_association" {
  type    = bool
  default = false
}

variable "auto_accept_shared_attachments" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "description" {
  type    = string
  default = null
}

// Attachments Related Variables
#variable "attachments" {
#  type = list(object({
#    name                   = string
#    vpc_id                 = string
#    subnet_id              = string
#    auto_create_vpc_routes = optional(bool, false)
#    tags                   = optional(map, {})
#  }))
#  default = null
#}
#
#variable "route_tables" {
#  type = list(object({
#    name                   = string
#    description                = optional(string,null)
#    tags                   = optional(map, {})
#  }))
#  default = null
#}