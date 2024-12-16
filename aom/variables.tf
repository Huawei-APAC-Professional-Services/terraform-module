variable "prometheus_name" {
  type = string
}

variable "prometheus_type" {
  type = string
}

variable "prometheus_version" {
  type    = string
  default = null
}

variable "enterprise_project_id" {
  type    = string
  default = null
}

variable "prometheus_tag_sync" {
  type    = string
  default = "auto"
}

variable "connected_cloud_services" {
  type    = list(string)
  default = []
}

#variable "enabled_cross_account_aggregation_rule" {
#  type    = bool
#  default = false
#}
#
#variable "accounts_list" {
#  type    = map(string)
#  default = {}
#}