variable "availability_zone" {
  type = string
}

variable "performance_type" {
  type    = string
  default = "normal"
}

variable "cpu_count" {
  type    = number
  default = 4
}

variable "memory_size" {
  type    = number
  default = 8
}

variable "image_name" {
  type    = string
  default = "Ubuntu 22.04 server 64bit"
}

variable "instance_name_suffix" {
  type = string
}

variable "keypair_name" {
  type    = string
  default = null
}

variable "subnet_id" {
  type = string
}

variable "user_data" {
  type    = string
  default = null
}

variable "agency_name" {
  type    = string
  default = null
}