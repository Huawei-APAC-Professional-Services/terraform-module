variable "config_collect_all_supported_resource" {
  type    = bool
  default = true
}

# Example: ["vpc.vpcs", "rds.instances", "dms.kafkas", "dms.rabbitmqs", "dms.queues"]
variable "config_collect_specific_resources" {
  type    = list(string)
  default = null
}

# Example: {"bucket":"","region":""}
variable "obs_channel" {
  type    = list(map(string))
  default = []
}

# Example: {"smn_urn":"","region":""}
variable "smn_channel" {
  type    = list(map(string))
  default = []
}

# 2-4 of uppercase letters, lowercase letters, digits, and special characters for password
variable "password_combination" {
  type    = number
  default = 4
}

# password length can be 6-32
variable "minimum_password_length" {
  type    = number
  default = 8
}

# password reuse limitations 0 - 10
variable "password_reuse_limit" {
  type    = number
  default = 3
}

#  a character is allowed to consecutively present in a password 0-32
variable "consecutive_character_allowed" {
  type    = number
  default = 0
}

# password validity period, 0-180 days
variable "password_validity_period" {
  type    = number
  default = 0
}

# 0-1440
variable "minimum_password_age" {
  type    = number
  default = 0
}

variable "not_allow_username_as_password" {
  type    = bool
  default = true
}

# Disable account if it has not loggin in for a certain times, 0-240 days
variable "account_allowed_inactive_days" {
  type    = number
  default = 30
}

variable "login_banner" {
  type    = string
  default = null
}

# 15 - 1440 minutes
variable "account_lockout_time" {
  type    = number
  default = 15
}

# 3-10
variable "allowed_login_attempts" {
  type    = number
  default = 3
}

# 15-60
variable "login_attempts_tally_window" {
  type    = number
  default = 15
}

# 15-1440
variable "session_timeout" {
  type    = number
  default = 60
}

variable "display_last_login_info" {
  type    = bool
  default = true
}

variable "operation_protection_enabled" {
  type    = bool
  default = false
}

variable "operation_protection_third_party_email" {
  type    = string
  default = null
}

variable "operation_protection_third_party_mobile" {
  type    = string
  default = null
}

variable "iam_user_allow_self_managing_accesskey" {
  type    = bool
  default = false
}

variable "iam_user_allow_self_changing_password" {
  type    = bool
  default = true
}

variable "iam_user_allow_self_changing_email" {
  type    = bool
  default = false
}

variable "iam_user_allow_self_changing_mobile" {
  type    = bool
  default = false
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