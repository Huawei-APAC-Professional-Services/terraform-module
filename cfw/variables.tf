variable "name" {
  type = string
}

variable "flavor" {
  type    = string
  default = "Professional"
}

variable "cidr" {
  type    = string
  default = null
}

variable "attach_mode" {
  type    = string
  default = null
}

variable "er_id" {
  type    = string
  default = null
}

variable "east_west_protection_enabled" {
  type    = number
  default = null
}

variable "charging_mode" {
  type    = string
  default = "postPaid"
}

variable "period_unit" {
  type    = string
  default = null
}

variable "period" {
  type    = number
  default = null
}

variable "auto_renew_enabled" {
  type    = bool
  default = null
}

variable "ips_enabled" {
  type    = number
  default = null
}

variable "ips_mode" {
  type    = number
  default = null
}

variable "extend_vpc_count" {
  type    = number
  default = null
}

variable "extend_bandwidth" {
  type    = number
  default = null
}

variable "extend_eip_count" {
  type    = number
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

#variable "log_config" {
#  type = list(object({
#    lts_log_group_id         = string
#    lts_attack_log_stream_id = optional(string, null)
#    lts_access_log_stream_id = optional(string, null)
#    lts_flow_log_stream_id   = optional(string, null)
#  }))
#  default = []
#}
#
#variable "protected_eips" {
#  type = list(object({
#    id           = string
#    ipv4_address = string
#  }))
#  default = []
#}
