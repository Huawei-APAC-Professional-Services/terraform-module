variable "lts_group_id" {
  type = string
}

variable "lts_stream_id" {
  type = string
}

variable "log_transfer_type" {
  type    = string
  default = "OBS"
}

variable "log_transfer_mode" {
  type    = string
  default = "cycle"
}

variable "log_storage_format" {
  type    = string
  default = "RAW"
}

variable "log_transfer_status" {
  type    = string
  default = "ENABLE"
}

variable "obs_transfer_config" {
  type = list(object({
    obs_period           = optional(number, 2)
    obs_period_unit      = optional(string, "min")
    obs_bucket_name      = string
    obs_transfer_path    = optional(string, null)
    obs_dir_prefix_name  = optional(string, null)
    obs_prefix_name      = optional(string, null)
    obs_eps_id           = optional(string, null)
    obs_encrypted_enable = optional(bool, null)
    obs_encrypted_id     = optional(string, null)
    obs_time_zone        = optional(string, null)
    obs_time_zone_id     = optional(string, null)
  }))
  default = []
}

variable "dis_transfer_config" {
  type = list(object({
    dis_id   = optional(string, null)
    dis_name = optional(string, null)
  }))
  default = []
}

variable "kafka_transfer_config" {
  type = list(object({
    kafka_id    = optional(string, null)
    kafka_topic = optional(string, null)
  }))
  default = []
}

variable "transfer_agency_config" {
  type = list(object({
    agency_domain_name = optional(string, null)
    agency_domain_id   = optional(string, null)
    agency_name        = optional(string, null)
    agency_project_id  = optional(string, null)
  }))
  default = []
}