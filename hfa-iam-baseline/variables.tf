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