resource "huaweicloud_cts_tracker" "system_tracker" {
  for_each    = var.hfa_cts_regions
  region      = each.key
  bucket_name = each.value
}

data "huaweicloud_identity_group" "admin" {
  name = "admin"
}

locals {
  admin_users = toset([for u in data.huaweicloud_identity_group.admin.users : u.name])
  smn_topics  = { for v in huaweicloud_smn_topic.hfa_cts_topic : v.region => v.id }
}

resource "huaweicloud_smn_topic" "hfa_cts_topic" {
  for_each                 = var.hfa_cts_regions
  region                   = each.key
  name                     = var.hfa_cts_smn_topic_name
  display_name             = var.hfa_cts_smn_topic_display_name
  services_publish_allowed = "cts"
  introduction             = "created for hfa"
}

resource "huaweicloud_cts_notification" "hfa_root_user_login" {
  for_each       = var.hfa_cts_regions
  region         = each.key
  name           = "hfa_root_user_login"
  operation_type = "customized"
  smn_topic      = local.smn_topics[each.key]

  operations {
    service     = "IAM"
    resource    = "user"
    trace_names = var.hfa_root_user_monitored_activities
  }

  operation_users {
    group = "admin"
    users = local.admin_users
  }
}

resource "huaweicloud_smn_subscription" "security" {
  for_each  = var.hfa_key_security_event_notification_email == null ? [] : var.hfa_cts_regions
  region    = each.key
  topic_urn = local.smn_topics[each.key]
  endpoint  = var.hfa_key_security_event_notification_email
  protocol  = "email"
  remark    = "Security Notification"
}