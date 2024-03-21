resource "huaweicloud_smn_topic" "main" {
  name         = var.smn_topic_name
  display_name = var.smn_topic_display_name
  tags         = var.smn_tags
}

resource "huaweicloud_smn_subscription" "email_notification" {
  for_each  = toset(var.email_recipients_list)
  topic_urn = huaweicloud_smn_topic.main.id
  endpoint  = each.value
  protocol  = "email"
}

resource "huaweicloud_smn_subscription" "sms_notification" {
  for_each  = toset(var.sms_recipients_list)
  topic_urn = huaweicloud_smn_topic.main.id
  endpoint  = each.value
  protocol  = "email"
}
