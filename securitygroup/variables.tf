variable "securitygroup_name" {
  type        = string
  description = "The name of the security group"
}

variable "delete_default_rules" {
  type        = bool
  default     = false
  description = "Specify whether the default security group rules should be deleted"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for security group"
}

variable "rules" {
  type = list(object({
    name                    = string
    direction               = optional(string, "ingress")
    ethertype               = optional(string, "IPv4")
    protocol                = optional(string, "tcp")
    port_range_min          = optional(number, null)
    port_range_max          = optional(number, null)
    ports                   = optional(string, null)
    remote_ip_prefix        = optional(string, null)
    remote_group_id         = optional(string, null)
    remote_address_group_id = optional(string, null)
    action                  = optional(string, null)
    priority                = optional(number, null)
  }))
}