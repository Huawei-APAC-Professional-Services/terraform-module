variable "hfa_cts_regions" {
  type = map(string)
}

variable "hfa_cts_smn_topic_name" {
  type = string
  default = "hfa_cts_topic"
}

variable "hfa_cts_smn_topic_display_name" {
  type = string
  default = "hfa cts topic"
}

variable "hfa_root_user_monitored_activities" {
  type = list(string)
  default = [ "login" ]
}