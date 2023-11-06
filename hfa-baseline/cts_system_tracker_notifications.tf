locals {
  key_notifiable_events = [
    { "Service" : "CTS", "Resource" : "tracker", "Operations" : ["updateTracker", "deleteTracker"] },
    { "Service" : "CTS", "Resource" : "notification", "Operations" : ["updateNotification", "deleteNotification"] },
    { "Service" : "CTS", "Resource" : "notification", "Operations" : ["updateNotification", "deleteNotification"] },
    { "Service" : "KMS", "Resource" : "cmk", "Operations" : ["disableKey", "scheduleKeyDeletion", "deleteKeyRiskTips", "enableKey", "cancelKeyDeletion"] },
    { "Service" : "OBS", "Resource" : "bucket", "Operations" : ["deleteBucket", "deleteBucketCustomdomain", "deleteBucketLifecycle", "deleteBucketPolicy", "deleteBucketReplication", "deleteBucketWebsite"] },
    { "Service" : "VPC", "Resource" : "eip", "Operations" : ["createEip", "unbindEip"] },
    { "Service" : "VPC", "Resource" : "vpc", "Operations" : ["deleteVpc", "modifyVpc"] },
    { "Service" : "VPC", "Resource" : "vpn", "Operations" : ["createVpn", "deleteVpn", "modifyVpn"] },
    { "Service" : "VPC", "Resource" : "security-groups", "Operations" : ["updateSecurity-group", "deleteSecurity-group"] },
    { "Service" : "IAM", "Resource" : "SecurityPolicy", "Operations" : ["modifySecurityPolicy"] },
    { "Service" : "IAM", "Resource" : "domain", "Operations" : ["updateSecurityPolicies", "updatePasswordPolicies", "updateACLPolicies", "updateWarningPolicies", "deleteDomain"] },
    { "Service" : "VPC(NAT)", "Resource" : "dnatrule", "Operations" : ["createDnatRule", "deleteDnatRule", "updateDnatRule"] },
    { "Service" : "VPC(NAT)", "Resource" : "snatrule", "Operations" : ["createSnatRule", "deleteSnatRule", "updateSnatRule"] }
  ]
  all_notifiable_events = var.hfa_cts_notification_additional == null ? local.key_notifiable_events : concat(local.key_notifiable_events, var.hfa_cts_notification_additional)
}

resource "huaweicloud_cts_notification" "hfa_key_event_notification" {
  for_each       = var.hfa_cts_regions
  region         = each.key
  name           = "hfa_cts_key_notifications"
  operation_type = "customized"
  smn_topic      = local.smn_topics[each.key]

  dynamic "operations" {
    for_each = local.all_notifiable_events
    content {
      service     = operations.value["Service"]
      resource    = operations.value["Resource"]
      trace_names = operations.value["Operations"]
    }
  }
}