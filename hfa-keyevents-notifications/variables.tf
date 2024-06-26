variable "smn_topic_name" {
  type = string
}

variable "smn_topic_display_name" {
  type    = string
  default = ""
}

variable "smn_tags" {
  type    = map(any)
  default = null
}

variable "email_recipients_list" {
  type    = list(string)
  default = []
}

variable "sms_recipients_list" {
  type    = list(string)
  default = []
}

variable "enable_unauthorized_access_notification" {
  type    = bool
  default = true
}

variable "unauthorized_access_notifications_rule" {
  type    = list(string)
  default = ["code = 403"]
}

variable "unauthorized_access_notifications_condition" {
  type    = string
  default = "AND"
}

variable "critical_event" {
  type    = list(any)
  default = []
}

variable "enable_root_access_notification" {
  type    = bool
  default = true
}