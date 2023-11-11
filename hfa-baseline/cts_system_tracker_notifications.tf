locals {
  key_notifiable_events = [
    { "Service" : "CTS", "Resource" : "tracker", "Operations" : ["updateTracker", "deleteTracker"] },
    { "Service" : "CTS", "Resource" : "notification", "Operations" : ["updateNotification", "deleteNotification"] },
    { "Service" : "CTS", "Resource" : "notification", "Operations" : ["updateNotification", "deleteNotification"] },
    { "Service" : "KMS", "Resource" : "cmk", "Operations" : ["disableKey", "scheduleKeyDeletion", "deleteKeyRiskTips", "enableKey", "cancelKeyDeletion"] },
    { "Service" : "OBS", "Resource" : "bucket", "Operations" : ["deleteBucket", "deleteBucketCustomdomain", "deleteBucketLifecycle", "deleteBucketPolicy", "deleteBucketReplication", "deleteBucketWebsite", "setBucketAcl", "setBucketPolicy", "setBucketVersioning", "setBucketLifecycle"] },
    { "Service" : "VPC", "Resource" : "eip", "Operations" : ["createEip", "unbindEip"] },
    { "Service" : "VPC", "Resource" : "vpc", "Operations" : ["deleteVpc", "modifyVpc"] },
    { "Service" : "VPC", "Resource" : "firewall-groups", "Operations" : ["updateFirewallGroup", "deleteFirewallGroup", "createFirewallGroup"] },
    { "Service" : "VPC", "Resource" : "vpn", "Operations" : ["createVpn", "deleteVpn", "modifyVpn"] },
    { "Service" : "VPC", "Resource" : "security-groups", "Operations" : ["updateSecurity-group", "deleteSecurity-group"] },
    { "Service" : "VPC", "Resource" : "routetables", "Operations" : ["updateRouteTable", "deleteRouteTable"] },
    { "Service" : "IAM", "Resource" : "SecurityPolicy", "Operations" : ["modifySecurityPolicy"] },
    { "Service" : "IAM", "Resource" : "MFA", "Operations" : ["UnBindMFA"] },
    { "Service" : "IAM", "Resource" : "Policy", "Operations" : ["createRole", "updateRole", "deleteRole"] },
    { "Service" : "IAM", "Resource" : "user", "Operations" : ["modifyUserMobile", "modifyUserEmail", "updateCredential"] },
    { "Service" : "IAM", "Resource" : "user", "Operations" : ["modifyUserMobile", "modifyUserEmail", "updateCredential"] },
    { "Service" : "RMS", "Resource" : "trackerConfig", "Operations" : ["createOrUpdateTrackerConfig", "deleteTrackerConfig"] },
    { "Service" : "RMS", "Resource" : "policy", "Operations" : ["deletePolicyAssignment", "updatePolicyAssignment", "disablePolicyAssignment"] },
    { "Service" : "VPC(NAT)", "Resource" : "dnatrule", "Operations" : ["createDnatRule", "deleteDnatRule", "updateDnatRule"] },
    { "Service" : "VPC(NAT)", "Resource" : "snatrule", "Operations" : ["createSnatRule", "deleteSnatRule", "updateSnatRule"] },
    { "Service" : "Organizations", "Resource" : "Organizations", "Operations" : ["DeleteOrganizations", "LeaveOrganizations"] },
    { "Service" : "Organizations", "Resource" : "DelegatedAdministrator", "Operations" : ["RegisterDelegatedAdministrator", "DeregisterDelegatedAdministrator"] },
    { "Service" : "Organizations", "Resource" : "TrustedService", "Operations" : ["EnableTrustedService", "DisableTrustedService"] },
    { "Service" : "Organizations", "Resource" : "Account", "Operations" : ["InviteAccount", "RemoveAccount", "MoveAccount"] }
  ]
  key_notifiable_events_root = [
    { "Service" : "IAM", "Resource" : "user", "Operations" : ["login"] },
    { "Service" : "IAM", "Resource" : "credential", "Operations" : ["createCredential"] }
  ]
  smn_topics                 = { for v in huaweicloud_smn_topic.hfa_cts_topic : v.region => v.id }
  admin_users                = toset([for u in data.huaweicloud_identity_group.admin.users : u.name])
  all_notifiable_events      = var.hfa_cts_notification_additional == null ? local.key_notifiable_events : concat(local.key_notifiable_events, var.hfa_cts_notification_additional)
  all_notifiable_events_root = var.hfa_root_user_monitored_activities_additional == null ? local.key_notifiable_events_root : concat(local.key_notifiable_events_root, var.hfa_root_user_monitored_activities_additional)
}

resource "huaweicloud_cts_notification" "hfa_key_event_notification" {
  for_each       = var.hfa_cts_regions_obs_config
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

resource "huaweicloud_cts_notification" "hfa_root_user" {
  for_each       = var.hfa_cts_regions_obs_config
  region         = each.key
  name           = "hfa_root_user_login"
  operation_type = "customized"
  smn_topic      = local.smn_topics[each.key]

  dynamic "operations" {
    for_each = local.all_notifiable_events_root
    content {
      service     = operations.value["Service"]
      resource    = operations.value["Resource"]
      trace_names = operations.value["Operations"]
    }
  }

  operation_users {
    group = "admin"
    users = local.admin_users
  }
}

resource "huaweicloud_smn_subscription" "security" {
  for_each  = var.hfa_key_security_event_notification_email == null ? {} : var.hfa_cts_regions_obs_config
  region    = each.key
  topic_urn = local.smn_topics[each.key]
  endpoint  = var.hfa_key_security_event_notification_email
  protocol  = "email"
  remark    = "Security Notification"
}