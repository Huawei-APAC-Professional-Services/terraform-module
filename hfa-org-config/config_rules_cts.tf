data "huaweicloud_rms_policy_definitions" "cts_support_validate_check" {
  name = "cts-support-validate-check"
}

resource "huaweicloud_rms_organizational_policy_assignment" "cts_support_validate_check" {
  organization_id      = local.organization_id
  name                 = "cts-support-validate-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.cts_support_validate_check.definitions[0].id, "")
  policy_filter {
    resource_provider = "cts"
    resource_type     = "trackers"
  }
}

data "huaweicloud_rms_policy_definitions" "cts_tracker_exists" {
  name = "cts-tracker-exists"
}

resource "huaweicloud_rms_organizational_policy_assignment" "cts_tracker_exists" {
  organization_id      = local.organization_id
  name                 = "cts-tracker-exists"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.cts_tracker_exists.definitions[0].id, "")
  period = var.config_check_period
}

data "huaweicloud_rms_policy_definitions" "cts_kms_encrypted_check" {
  name = "cts-kms-encrypted-check"
}

resource "huaweicloud_rms_organizational_policy_assignment" "cts_kms_encrypted_check" {
  organization_id      = local.organization_id
  name                 = "cts-kms-encrypted-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.cts_kms_encrypted_check.definitions[0].id, "")
  policy_filter {
    resource_provider = "cts"
    resource_type     = "trackers"
  }
}

data "huaweicloud_rms_policy_definitions" "resources_in_supported_region" {
  name = "resources-in-supported-region"
}

resource "huaweicloud_rms_organizational_policy_assignment" "resources_in_supported_region" {
  organization_id      = local.organization_id
  name                 = "resources-in-supported-region"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.resources_in_supported_region.definitions[0].id, "")
  parameters = {
    regions = jsonencode(var.allowed_regions)
  }
}