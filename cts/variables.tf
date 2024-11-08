variable "cts_bucket_name" {
  type = string
}

variable "cts_enabled" {
  type    = bool
  default = true
}

variable "cts_kms_id" {
  type    = string
  default = null
}

variable "cts_log_file_prefix" {
  type    = string
  default = null
}

variable "cts_lts_enabled" {
  type    = bool
  default = false
}

variable "organization_enabled" {
  type    = bool
  default = true
}

variable "validation_enabled" {
  type    = bool
  default = true
}

variable "is_sort_by_service" {
  type    = bool
  default = true
}

variable "excluded_service" {
  type    = list(string)
  default = ["KMS"]
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "deltetion_enabled" {
  type    = bool
  default = false
}