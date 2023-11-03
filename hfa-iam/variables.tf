variable "hfa_iam_account_name" {
  type        = string
  description = "Central IAM Account Name"
}

variable "hfa_security_account_name" {
  type        = string
  description = "Security Operation Account"
}

variable "hfa_security_admin_agency_name" {
  type    = string
  default = "hfa_security_admin"
}

variable "hfa_network_admin_agency_name" {
  type    = string
  default = "hfa_network_admin"
}

variable "hfa_base_agency_name" {
  type    = string
  default = "hfa_base"
}

variable "hfa_cts_log_transfer_agency_name" {
  type    = string
  default = "hfa_cts_log_transfer"
}