variable "name" {
  type = string
}

variable "engine_type" {
  type    = string
  default = "elasticsearch"
}

variable "engine_version" {
  type    = string
  default = "7.10.2"
}

variable "security_mode" {
  type    = bool
  default = true
}

variable "admin_password" {
  type    = string
  default = null
}

variable "https_enabled" {
  type    = bool
  default = true
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "secgroup_id" {
  type = string
}

variable "availability_zone" {
  type = string
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

variable "master_node_config" {
  type = list(object({
    flavor          = string
    instance_number = number
    volume_type     = string
    volume_size     = number
  }))
  default = []
}

variable "data_node_config" {
  type = list(object({
    flavor          = string
    instance_number = number
    volume_type     = string
    volume_size     = number
  }))
}

variable "client_node_config" {
  type = list(object({
    flavor          = string
    instance_number = number
    volume_type     = string
    volume_size     = number
  }))
  default = []
}

variable "cold_node_config" {
  type = list(object({
    flavor          = string
    instance_number = number
    volume_type     = string
    volume_size     = number
  }))
  default = []
}

variable "public_access" {
  type = list(object({
    bandwidth         = number
    whitelist_enabled = bool
    whitelist_cidrs   = optional(string, null)
  }))
  default = []
}

variable "kibana_public_access" {
  type = list(object({
    bandwidth         = number
    whitelist_enabled = bool
    whitelist_cidrs   = string
  }))
  default = []
}

variable "backup_strategy" {
  type = list(object({
    start_time  = string
    keep_days   = optional(number, null)
    prefix      = optional(string, null)
    bucket      = optional(string, null)
    backup_path = optional(string, null)
    agency      = optional(string, null)
  }))
  default = []
}

variable "vpcep_endpoint" {
  type = list(object({
    endpoint_with_dns_name = bool
    whitelist_cidrs        = optional(string, null)
  }))
  default = []
}