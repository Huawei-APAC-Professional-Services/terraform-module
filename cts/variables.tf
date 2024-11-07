variable "cts_bucket_name" {
  type = string
}

variable "create_cts_bucket" {
  type    = bool
  default = false
}

variable "cts_bucket_tags" {
  type    = map(string)
  default = {}
}

variable "cts_bucket_storage_class" {
  type    = string
  default = "STANDARD"
}

variable "cts_bucket_enable_versioning" {
  type    = bool
  default = true
}

variable "cts_bucket_log_retention_period" {
  type    = number
  default = 3650
}

variable "cts_bucket_sse_algorithm" {
  type    = string
  default = "AES256"
}

variable "cts_encryption_kms_id" {
  type    = string
  default = null
}