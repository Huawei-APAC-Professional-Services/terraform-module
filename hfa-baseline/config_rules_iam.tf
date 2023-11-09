data "huaweicloud_rms_policy_definitions" "iam_key_rotation" {
  name         = "access-keys-rotated"
  policy_type  = "builtin"
  trigger_type = "period"
}

resource "huaweicloud_rms_policy_assignment" "iam_key_rotation" {
  name                 = "access-keys-rotated"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_key_rotation.definitions[0].id, "")
  status               = "Enabled"
  period               = var.hfa_config_period
  parameters = {
    maxAccessKeyAge = jsonencode(tostring(var.hfa_iam_key_age))
  }
}

data "huaweicloud_rms_policy_definitions" "iam_group_has_users_check" {
  name         = "iam-group-has-users-check"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "iam_group_has_users_check" {
  name                 = "iam-group-has-users-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_group_has_users_check.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "iam_root_access_key_check" {
  name         = "iam-root-access-key-check"
  policy_type  = "builtin"
  trigger_type = "period"
}

resource "huaweicloud_rms_policy_assignment" "iam_root_access_key_check" {
  name                 = "iam-root-access-key-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_root_access_key_check.definitions[0].id, "")
  status               = "Enabled"
  period               = var.hfa_config_period
}

data "huaweicloud_rms_policy_definitions" "iam_user_mfa_enabled" {
  name         = "iam-user-mfa-enabled"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "iam_user_mfa_enabled" {
  name                 = "iam-user-mfa-enabled"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_user_mfa_enabled.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "iam_user_single_access_key" {
  name         = "iam-user-single-access-key"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "iam_user_single_access_key" {
  name                 = "iam-user-single-access-key"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_user_single_access_key.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "mfa_enabled_for_iam_console_access" {
  name         = "mfa-enabled-for-iam-console-access"
}

resource "huaweicloud_rms_policy_assignment" "mfa_enabled_for_iam_console_access" {
  name                 = "mfa-enabled-for-iam-console-access"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.mfa_enabled_for_iam_console_access.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "root_account_mfa_enabled" {
  name         = "root-account-mfa-enabled"
  policy_type  = "builtin"
  trigger_type = "period"
}

resource "huaweicloud_rms_policy_assignment" "root_account_mfa_enabled" {
  name                 = "root-account-mfa-enabled"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.root_account_mfa_enabled.definitions[0].id, "")
  status               = "Enabled"
  period               = var.hfa_config_period
}

data "huaweicloud_rms_policy_definitions" "iam_user_console_and_api_access_at_creation" {
  name         = "iam-user-console-and-api-access-at-creation"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "iam_user_console_and_api_access_at_creation" {
  name                 = "iam-user-console-and-api-access-at-creation"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_user_console_and_api_access_at_creation.definitions[0].id, "")
  status               = "Enabled"
}