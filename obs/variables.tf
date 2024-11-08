variable "name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "acl" {
  type    = string
  default = "private"
}

variable "bucket_policy" {
  type    = string
  default = null
}

variable "policy_format" {
  type    = string
  default = null
}

variable "storage_class" {
  type    = string
  default = "STANDARD"
}

variable "enable_versioning" {
  type    = bool
  default = false
}

variable "logging" {
  type = map(object({
    target_bucket = string
    target_prefix = optional(string, null)
    agency        = string
  }))
  default = {}
}

variable "sse_algorithm" {
  type    = string
  default = "AES256"
}

variable "kms_id" {
  type    = string
  default = null
}

variable "multi_az_enabled" {
  type    = bool
  default = true
}

variable "encryption_enabled" {
  type    = bool
  default = true
}

variable "bucket_quota" {
  type    = number
  default = null
}

variable "website" {
  type = list(object({
    index_document = optional(string, null)
    error_document = optional(string, null)
    routing_rules  = optional(string, null)

  }))
  default = []
}

variable "cors_rule" {
  type = map(object({
    allowed_origins = list(string)
    allowed_methods = list(string)
    allowed_headers = list(string)
    expose_headers  = list(string)
    max_age_seconds = optional(number, null)
  }))
  default = {}
}

#variable "lifecycle_rule" {
#  type = list(object({
#    name = string
#    enabled = optional(bool,true)
#    prefix = optional(string,null)
#    
#  }))
#  default = []
#}