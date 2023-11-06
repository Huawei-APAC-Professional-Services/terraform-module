// This variable contains the information about the region and it's relevant bucket for cts data dump in that region in the security account
// format: {"ap-southeast-1":"bucket-a"}
variable "hfa_cts_regions" {
  type = map(string)
}

// Currently this variable is used to create config service on the assumption that security account 
// is responsible for aggregating config log in security account and creating authorization in every account except security account.
variable "hfa_security_account_id" {
  type = string
}

variable "hfa_cts_smn_topic_name" {
  type    = string
  default = "hfa_cts_topic"
}

variable "hfa_cts_smn_topic_display_name" {
  type    = string
  default = "hfa cts topic"
}

variable "hfa_root_user_monitored_activities" {
  type    = list(string)
  default = ["login"]
}

// email for receiving key events notification
// only allow a single email address, recommend customer to use a group address for multiple receiver scenario
variable "hfa_key_security_event_notification_email" {
  type    = string
  default = null
}

// Config aggregator name in security account
variable "hfa_config_aggregator_name" {
  type    = string
  default = "hfa"
}

// Huawei Cloud account ids from which config service will aggregate data
variable "hfa_config_accounts_list" {
  type    = list(string)
  default = []
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

/*
Additional CTS Notifications
Format: [{"Service":"CTS","Resource":"tracker","Operations":["updateTracker","deleteTracker"]},{"Service":"CTS","Resource":"notification","Operations":["updateNotification","deleteNotification"]}]
*/

variable "hfa_cts_notification_additional" {
  type    = list(map(string))
  default = null
}
