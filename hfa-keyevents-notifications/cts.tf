resource "huaweicloud_cts_notification" "unauthorized_access" {
  count          = var.enable_unauthorized_access_notification ? 1 : 0
  name           = "unauthorized_access"
  operation_type = "complete"
  smn_topic      = huaweicloud_smn_topic.main.id

  filter {
    condition = var.unauthorized_access_notifications_condition
    rule      = var.unauthorized_access_notifications_rule
  }
}

resource "huaweicloud_cts_notification" "critical_event" {
  name           = "critical_event"
  operation_type = "customized"
  smn_topic      = huaweicloud_smn_topic.main.id

  dynamic "operations" {
    for_each = var.critical_event
    content {
      service     = operations.value["Service"]
      resource    = operations.value["Resource"]
      trace_names = operations.value["Operations"]
    }
  }
}