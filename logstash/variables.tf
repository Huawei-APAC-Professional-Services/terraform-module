variable "name" {
  type = string
}

variable "engine_version" {
  type    = string
  default = "7.10.0"
}

variable "availability_zone" {
  type = string
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

variable "tags" {
  type    = map(string)
  default = {}
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

variable "node_config" {
  type = list(object({
    flavor          = string
    instance_number = number
    volume_type     = optional(string, "ULTRAHIGH")
    volume_size     = number
  }))
  default = []
}

variable "routes" {
  type = list(object({
    ip_address  = string
    ip_net_mask = string
  }))
  default = []
}

variable "logstash_config" {
  type = list(object({
    name                     = string
    conf_content             = string
    workers                  = optional(number, null)
    batch_size               = optional(number, 125)
    batch_delay_ms           = optional(number, null)
    queue_type               = optional(string, "memory")
    queue_check_point_writes = optional(number, 1024)
    queue_max_bytes_mb       = optional(number, 1024)
  }))
  default = []
}