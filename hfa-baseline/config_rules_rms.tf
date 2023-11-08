data "huaweicloud_rms_policy_definitions" "tracker_config_enabled_check" {
  name         = "tracker-config-enabled-check"
  policy_type  = "builtin"
  trigger_type = "period"
}

resource "huaweicloud_rms_policy_assignment" "tracker_config_enabled_check" {
  name                 = "tracker-config-enabled-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.tracker_config_enabled_check.definitions[0].id, "")
  status               = "Enabled"
  period               = var.hfa_config_period
  parameters = {
    regionList = "[\"${local.enalbed_regions}\"]"
  }
}