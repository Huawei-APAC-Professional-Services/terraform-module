// Currently this variable is used to create config service on the assumption that security account 
// is responsible for aggregating config log in security account and creating authorization in every account except security account.
variable "hfa_security_account_id" {
  type = string
}

// Config aggregator name in security account
variable "hfa_config_aggregator_name" {
  type    = string
  default = "hfa"
}

// Huawei Cloud account ids from which config service will aggregate data
variable "hfa_config_accounts_list" {
  type    = list(string)
}

// config bucket name and region, config allow using bucket in another region
// usually this bucket should be in the security account
variable "hfa_config_bucket_name" {
  type = string
}

variable "hfa_config_bucket_region" {
  type = string
}


variable "hfa_config_smn_topic" {
  type    = map(string)
  default = {}
}

variable "hfa_config_period" {
  type    = string
  default = "Six_Hours"
}
