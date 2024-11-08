variable "alias" {
  type = string
}

variable "enabled" {
  type    = bool
  default = true
}

variable "algorithm" {
  type    = string
  default = "AES_256"
}

variable "type" {
  type        = string
  description = "ENCRYPT_DECRYPT (symmetric key default value) or SIGN_VERIFY (asymmetric key default value)"
  default     = "ENCRYPT_DECRYPT"
}

variable "description" {
  type    = string
  default = null
}

variable "key_source" {
  type    = string
  default = "kms"
}

variable "keystore_id" {
  type    = string
  default = null
}

variable "rotation_enabled" {
  type    = bool
  default = false
}

variable "rotation_interval" {
  type    = number
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}


