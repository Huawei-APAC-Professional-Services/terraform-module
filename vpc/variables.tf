variable "tags" {
  description = "Tags that needs to be added to all resources"
  type        = map(string)
  default     = {}
}

variable "enterprise_project_id" {
  type        = string
  description = "The enterprise project id"
  default     = null
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR of the VPC"
  type        = string
}

variable "vpc_description" {
  type        = string
  description = "The description of the VPC"
  default     = null
}

variable "vpc_secondary_cidrs" {
  type        = list(string)
  default     = null
  description = "The VPC secondary cidrs"
  validation {
    condition     = (var.vpc_secondary_cidrs == null || alltrue([for cidr in var.vpc_secondary_cidrs : !contains(["172.31.0.0/16", "192.168.0.0/16", "100.64.0.0/10", "214.0.0.0/7", "198.18.0.0/15", "169.254.0.0/16", "0.0.0.0/8", "127.0.0.0/8", "240.0.0.0/4", "255.255.255.255/32"], cidr)]))
    error_message = "Some CIDRs are not allowed to be used as secondary VPC CIDR, Vist https://support.huaweicloud.com/intl/en-us/usermanual-vpc/vpc_vpc_0007.html for more infromation"
  }
}

variable "vpc_tags" {
  description = "Specific tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "vpc_flowlog_enabled" {
  type        = bool
  default     = false
  description = "Enable VPC flowlog at VPC level"
}

variable "vpc_flowlog_name" {
  type        = string
  default     = null
  description = "The name of the vpc flow log at vpc level"
}

variable "subnets" {
  description = "List of subnets object including name and cidr"
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = optional(string, null)
    tags              = optional(map(string), {})
    description       = optional(string, null)
  }))
}

variable "flow_log_traffic_type" {
  description = "The type of traffic to capture. Valid values: accept, reject, all."
  type        = string
  default     = "all"
}

variable "log_group_id" {
  type        = string
  description = "LTS Log Gropup ID for vpc flow log"
  default     = null
}

variable "log_stream_id" {
  type        = string
  description = "LTS Log Stream ID for vpc flow log"
  default     = null
}