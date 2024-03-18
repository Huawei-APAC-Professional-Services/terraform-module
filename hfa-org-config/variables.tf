variable "config_check_period" {
  type    = string
  default = "Six_Hours"
}

variable "allowed_regions" {
  type = list(string)
}

variable "iam_max_key_age" {
  type    = number
  default = 90
}

variable "excluded_accounts_for_root_mfa" {
  type    = list(string)
  default = null
}

variable "organization_id" {
  type = string
}