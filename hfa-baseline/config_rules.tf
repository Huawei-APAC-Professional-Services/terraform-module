data "huaweicloud_rms_policy_definitions" "iam_key_rotation" {
  name         = "access-keys-rotated"
  policy_type  = "builtin"
  trigger_type = "period"
}

resource "huaweicloud_rms_policy_assignment" "iam_key_rotation" {
  name                 = "access-keys-rotated"
  description          = "An IAM users is noncompliant if the access keys have not been rotated for more than maxAccessKeyAge number of days."
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_key_rotation.definitions[0].id, "")
  status               = "Enabled"
  period               = var.hfa_config_period
  parameters = {
    "maxAccessKeyAge" = "\"90\""
  }
}

data "huaweicloud_rms_policy_definitions" "cce_endpoint_public_access" {
  name         = "cce-endpoint-public-access"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "cce_endpoint_public_access" {
  name                 = "cce-endpoint-public-access"
  description          = "A CCE cluster is noncompliant if it has an EIP."
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.cce_endpoint_public_access.definitions[0].id, "")
  status               = "Enabled"
}