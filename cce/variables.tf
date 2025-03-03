variable "cluster_name" {
  type = string
}

variable "cluster_alias" {
  type    = string
  default = null
}

variable "cluster_version" {
  type    = string
  default = null
}

variable "cluster_type" {
  type    = string
  default = "VirtualMachine"
}

variable "cluster_flavor_id" {
  type = string
}

variable "cluster_description" {
  type    = string
  default = null
}

variable "vpc_id" {
  type = string
}

variable "node_subnet_id" {
  type = string
}

variable "container_network_type" {
  type    = string
  default = "eni"
}

variable "node_security_group_id" {
  type    = string
  default = null
}

variable "container_network_cidr" {
  type    = string
  default = null
}

variable "service_network_cidr" {
  type    = string
  default = null
}

variable "eni_ipv4_subnet_id" {
  type    = string
  default = null
}

variable "authentication_mode" {
  type    = string
  default = null
}

variable "authenticating_proxy_ca" {
  type    = string
  default = null
}

variable "authenticating_proxy_cert" {
  type    = string
  default = null
}

variable "authenticating_proxy_private_key" {
  type    = string
  default = null
}

variable "multi_az" {
  type    = bool
  default = null
}

variable "api_eip_address" {
  type = string
}

variable "kube_proxy_mode" {
  type    = string
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

variable "tags" {
  type    = map(string)
  default = {}
}

variable "node_pools" {
  type = list(object({
    name               = string
    initial_node_count = optional(number, 1)
    flavor_id          = string
    type               = optional(string, "vm")
    availability_zone  = optional(string, null)
    os                 = optional(string, "Ubuntu 22.04")
    key_pair           = optional(string, null)
    password           = optional(string, null)
    subnet_id          = optional(string, null)
    ecs_group_id       = optional(string, null)
    extend_params = optional(object({
      max_pods            = optional(number, null)
      docker_base_size    = optional(number, null)
      preinstall          = optional(string, null)
      postinstall         = optional(string, null)
      node_image_id       = optional(string, null)
      node_multi_queue    = optional(string, null)
      nic_threshold       = optional(string, null)
      agency_name         = optional(string, null)
      kube_reserved_mem   = optional(number, null)
      system_reserved_mem = optional(number, null)
    }), null)
  }))
  default = []
}