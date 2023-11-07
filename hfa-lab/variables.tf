// This variable is the account name at the same time the root user name
variable "huaweicloud_account_name" {
  type = string
}

variable "enterprise_administrator_password" {
  type = string
}

variable "enterprise_administrator_email" {
  type = string
}

variable "enterprise_administrator_require_password_reset" {
  type = bool
  default = false
}
