variable "availability_zone" {
  type        = string
  description = "The name of availability zone in which ECS will be deployed"
}

variable "ecs_name" {
  type        = string
  description = "Name of the ecs"
}

variable "image_id" {
  type        = string
  description = "image id of the ecs"
  default     = ""
}

variable "image_name" {
  type        = string
  description = "The name of the image"
  default     = ""
}

variable "image_visibility" {
  type        = string
  description = "The source of the image, could be private, public, market or shared"
  default     = "private"
}

variable "image_architecture" {
  type        = string
  description = "image architecture type"
  default     = "x86"
}

variable "flavor_id" {
  type        = string
  description = "flavor of the ecs"
}

variable "secgroup_ids" {
  type        = list(string)
  description = "List of security group ids"
}

variable "system_disk_type" {
  type        = string
  description = "system disk type for the ecs"
  validation {
    condition     = contains(["SSD", "GPSSD", "ESSD", "GPSSD2", "ESSD2"], var.system_disk_type)
    error_message = "The provided system disk type is not available"
  }
}

variable "system_disk_size" {
  type        = number
  description = "Size of the system disk in Gigabyte"
}

variable "system_disk_iops" {
  type        = number
  default     = null
  description = "IOPS of the system disk"
}

variable "system_disk_throughput" {
  type        = number
  default     = null
  description = "Throughput for system disk"
}


variable "data_disks" {
  type = list(object({
    disk_type   = string
    disk_size   = number
    snapshot_id = optional(string, null)
    kms_key_id  = optional(string, null)
    iops        = optional(number, null)
    throughput  = optional(number, null)
  }))
  default     = null
  description = "A list of data disks that are required by ECS"
}

variable "networks" {
  type = list(object({
    subnet_id         = string
    fixed_ip_v4       = optional(string, null)
    ipv6_enable       = optional(bool, false)
    source_dest_check = optional(bool, true)
    access_network    = optional(bool, false)
  }))
  description = "A list of networks that are required by ECS"
}

variable "eip_id" {
  type        = string
  default     = null
  description = "The EIP that bounded to the instance"
}

variable "delete_eip_on_termination" {
  type        = bool
  default     = false
  description = "Whether to delete EIP when delete the instance"
}

variable "key_pair_name" {
  type        = string
  default     = null
  description = "The name of the key pair that is used for the instance"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for ecs instance"
}

variable "delete_disks_on_termination" {
  type        = bool
  description = "Delete data disks when instance is terminated"
  default     = false
}

variable "admin_pass" {
  type        = string
  default     = null
  description = "Administrator or root password"
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "kms key id for disk encryption"
}

variable "agent_list" {
  type        = string
  default     = null
  description = "The agents that need to be installed"
}

variable "agency_name" {
  type        = string
  default     = null
  description = "The agency assigned to the instance"
}

variable "user_data" {
  type        = string
  description = "The user data for the instance"
  default     = null
}
