variable "name" {
  type = string
}

variable "asn" {
  type    = number
  default = 64512
}

variable "auto_accept_shared_attachments" {
  type    = bool
  default = false
}

variable "enable_default_propagation" {
  type    = bool
  default = false
}

variable "enable_default_association" {
  type    = bool
  default = false
}

variable "default_propagation_route_table_id" {
  type    = string
  default = null
}

variable "default_association_route_table_id" {
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

variable "route_tables" {
  type = list(object({
    name        = string
    description = optional(string, null)
    tags        = optional(map(string), {})
  }))
  default = []
}

variable "attachments" {
  type = list(object({
    name        = string
    description = optional(string, null)
    enabled     = optional(bool, true)
    vpc_id      = string
    subnet_id   = string
    tags        = optional(map(string), {})
  }))
  default = []
}

variable "associations" {
  type = list(object({
    attachment_name  = string
    route_table_name = string
  }))
  default = []
}

variable "flowlog_config" {
  type = list(object({
    name            = string
    log_store_type  = optional(string, "LTS")
    log_group_id    = string
    log_stream_id   = string
    resource_type   = optional(string, "attachment")
    attachment_name = string
    description     = optional(string, null)
    enabled         = optional(bool, true)
  }))
  default = []
}

variable "static_routes" {
  type = list(object({
    name             = string
    route_table_name = string
    destination_cidr = string
    attachment_name  = optional(string, null)
    is_blackhole     = optional(bool, null)
  }))
  default = []
}