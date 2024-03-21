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

data "huaweicloud_identity_group" "admin" {
  name = "admin"
}

locals {
  admin_users = toset([for u in data.huaweicloud_identity_group.admin.users : u.name])
}

resource "huaweicloud_cts_notification" "admin_users_login" {
  name           = "admin_users_login"
  operation_type = "customized"
  smn_topic      = huaweicloud_smn_topic.main.id

  operations {
    service     = "IAM"
    resource    = "user"
    trace_names = ["login", "logout", "loginFailed"]
  }

  operation_users {
    group = "admin"
    users = local.admin_users
  }
}