data "huaweicloud_rms_policy_definitions" "kms_not_scheduled_for_deletion" {
  name         = "kms-not-scheduled-for-deletion"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "kms_not_scheduled_for_deletion" {
  name                 = "kms-not-scheduled-for-deletion"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.kms_not_scheduled_for_deletion.definitions[0].id, "")
  status               = "Enabled"
}