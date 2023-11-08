data "huaweicloud_rms_policy_definitions" "cts_support_validate_check" {
  name         = "cts-support-validate-check"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "cts_support_validate_check" {
  name                 = "cts-support-validate-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.cts_support_validate_check.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "cts_tracker_exists" {
  name         = "cts-tracker-exists"
  policy_type  = "builtin"
  trigger_type = "period"
}

resource "huaweicloud_rms_policy_assignment" "cts_tracker_exists" {
  name                 = "cts-tracker-exists"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.cts_tracker_exists.definitions[0].id, "")
  status               = "Enabled"
  period               = var.hfa_config_period
}

data "huaweicloud_rms_policy_definitions" "cts_kms_encrypted_check" {
  name         = "cts-kms-encrypted-check"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "cts_kms_encrypted_check" {
  name                 = "cts-kms-encrypted-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.cts_kms_encrypted_check.definitions[0].id, "")
  status               = "Enabled"
}

locals {
  // enalbed_regions = join("", ["[", join(",", [for k, v in var.hfa_cts_regions_obs_config : k]), "]"])
  enalbed_regions = jsonencode(tolist([for k, v in var.hfa_cts_regions_obs_config : k]))
}

data "huaweicloud_rms_policy_definitions" "multi_region_cts_tracker_exists" {
  name         = "multi-region-cts-tracker-exists"
  policy_type  = "builtin"
  trigger_type = "period"
}

resource "huaweicloud_rms_policy_assignment" "multi_region_cts_tracker_exists" {
  name                 = "multi-region-cts-tracker-exists"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.multi_region_cts_tracker_exists.definitions[0].id, "")
  status               = "Enabled"
  period               = var.hfa_config_period
  parameters = {
    regionList = local.enalbed_regions
  }
}

data "huaweicloud_rms_policy_definitions" "resources_in_supported_region" {
  name         = "resources-in-supported-region"
  policy_type  = "builtin"
  trigger_type = "period"
}

resource "huaweicloud_rms_policy_assignment" "resources_in_supported_region" {
  name                 = "resources-in-supported-region"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.resources_in_supported_region.definitions[0].id, "")
  status               = "Enabled"
  period               = var.hfa_config_period
  parameters = {
    regions = local.enalbed_regions
  }
}

