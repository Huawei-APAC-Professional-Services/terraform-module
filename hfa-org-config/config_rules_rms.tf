data "huaweicloud_rms_policy_definitions" "tracker_config_enabled_check" {
  name = "tracker-config-enabled-check"
}

resource "huaweicloud_rms_organizational_policy_assignment" "tracker_config_enabled_check" {
  organization_id      = local.organization_id
  name                 = "tracker-config-enabled-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.tracker_config_enabled_check.definitions[0].id, "")
  status = "Enabled"
  period = var.config_check_period
}