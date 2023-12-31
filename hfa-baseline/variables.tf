// This variable contains the information about the region and it's relevant bucket for cts data dump in that region in the security account
// format: {"ap-southeast-1":"bucket-a"}
variable "hfa_cts_regions_obs_config" {
  type = map(string)
}

variable "hfa_cts_lts_enabled" {
  type    = bool
  default = false
}

variable "hfa_cts_smn_topic_name" {
  type    = string
  default = "hfa_cts_topic"
}

variable "hfa_cts_smn_topic_display_name" {
  type    = string
  default = "hfa cts topic"
}

// [{"Service":"CTS","Resource":"tracker","Operations":["updateTracker","deleteTracker"]},{"Service":"CTS","Resource":"notification","Operations":["updateNotification","deleteNotification"]}]
variable "hfa_root_user_monitored_activities_additional" {
  type    = list(map(string))
  default = null
}

// email for receiving key events notification
// only allow a single email address, recommend customer to use a group address for multiple receiver scenario
variable "hfa_key_security_event_notification_email" {
  type    = string
  default = null
}

// config bucket name and region, config allow using bucket in another region
// usually this bucket should be in the security account
variable "hfa_config_bucket_name" {
  type = string
}

variable "hfa_config_bucket_region" {
  type = string
}

// Format: {"region name": "urn"}
variable "hfa_config_smn_topic" {
  type    = map(string)
  default = {}
}

variable "hfa_config_period" {
  type    = string
  default = "Six_Hours"
}

variable "hfa_config_aggregator_account_id" {
  type    = string
  default = null
}

variable "hfa_config_member_account_ids" {
  type    = list(string)
  default = null
}

variable "hfa_config_aggregator_name" {
  type    = string
  default = "hfa"
}

/*
Additional CTS Notifications
Format: [{"Service":"CTS","Resource":"tracker","Operations":["updateTracker","deleteTracker"]},{"Service":"CTS","Resource":"notification","Operations":["updateNotification","deleteNotification"]}]
*/

variable "hfa_cts_notification_additional" {
  type    = list(map(string))
  default = null
}

variable "hfa_iam_key_age" {
  type    = number
  default = 90
}
