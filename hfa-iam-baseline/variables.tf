variable "password_combination" {
  type        = number
  default     = 4
  description = "Require uppercase letters, lowercase letters, digits, and special characters in password"
}

variable "minimum_password_length" {
  type    = number
  default = 8
}

variable "password_reuse_limit" {
  type        = number
  default     = 2
  description = "The lastest 2 passwords are not allowed to use by default"
}

variable "password_validity_period" {
  type        = number
  default     = 180
  description = "Password must be changed after 180 days"
}

variable "console_acl_ip_cidrs" {
  type    = list(string)
  default = []
}

variable "console_acl_ip_ranges" {
  type    = list(string)
  default = []
}

variable "api_acl_ip_cidrs" {
  type    = list(string)
  default = []
}

variable "api_acl_ip_ranges" {
  type    = list(string)
  default = []
}

variable "enable_protection" {
  type    = bool
  default = false
}

variable "aksk_selfmanagement" {
  type    = bool
  default = false
}

variable "password_selfmanagement" {
  type    = bool
  default = false
}

variable "allow_change_email" {
  type    = bool
  default = false
}

variable "allow_change_mobile" {
  type    = bool
  default = false
}

variable "verification_email" {
  type = string
  default = null
}

variable "verification_mobile" {
  type = string
  default = null
}
