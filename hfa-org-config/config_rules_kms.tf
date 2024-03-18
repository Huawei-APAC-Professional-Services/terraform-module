data "huaweicloud_rms_policy_definitions" "kms_not_scheduled_for_deletion" {
  name = "kms-not-scheduled-for-deletion"
}

resource "huaweicloud_rms_organizational_policy_assignment" "kms_not_scheduled_for_deletion" {
  organization_id      = local.organization_id
  name                 = "kms-not-scheduled-for-deletion"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.kms_not_scheduled_for_deletion.definitions[0].id, "")
  policy_filter {
    resource_provider = "dew"
    resource_type     = "keys"
  }
  status = "Enabled"
}