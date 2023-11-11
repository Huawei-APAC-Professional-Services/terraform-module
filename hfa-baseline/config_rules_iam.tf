data "huaweicloud_rms_policy_definitions" "iam_key_rotation" {
  name = "access-keys-rotated"
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
  name = "iam-group-has-users-check"
}

resource "huaweicloud_rms_policy_assignment" "iam_group_has_users_check" {
  name                 = "iam-group-has-users-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_group_has_users_check.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "iam_user_mfa_enabled" {
  name = "iam-user-mfa-enabled"
}

resource "huaweicloud_rms_policy_assignment" "iam_user_mfa_enabled" {
  name                 = "iam-user-mfa-enabled"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_user_mfa_enabled.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "iam_user_single_access_key" {
  name = "iam-user-single-access-key"
}

resource "huaweicloud_rms_policy_assignment" "iam_user_single_access_key" {
  name                 = "iam-user-single-access-key"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_user_single_access_key.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "mfa_enabled_for_iam_console_access" {
  name = "mfa-enabled-for-iam-console-access"
}

resource "huaweicloud_rms_policy_assignment" "mfa_enabled_for_iam_console_access" {
  name                 = "mfa-enabled-for-iam-console-access"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.mfa_enabled_for_iam_console_access.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "root_account_mfa_enabled" {
  name = "root-account-mfa-enabled"
}

resource "huaweicloud_rms_policy_assignment" "root_account_mfa_enabled" {
  name                 = "root-account-mfa-enabled"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.root_account_mfa_enabled.definitions[0].id, "")
  status               = "Enabled"
  period               = var.hfa_config_period
}

data "huaweicloud_rms_policy_definitions" "iam_user_console_and_api_access_at_creation" {
  name = "iam-user-console-and-api-access-at-creation"
}

resource "huaweicloud_rms_policy_assignment" "iam_user_console_and_api_access_at_creation" {
  name                 = "iam-user-console-and-api-access-at-creation"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_user_console_and_api_access_at_creation.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "iam_password_policy" {
  name = "iam-password-policy"
}

resource "huaweicloud_rms_policy_assignment" "iam_password_policy" {
  name                 = "iam-password-policy"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_password_policy.definitions[0].id, "")
  status               = "Enabled"
  parameters = {
    pwdStrength = jsonencode("Strong")
  }
}

data "huaweicloud_rms_policy_definitions" "iam_role_has_all_permissions" {
  name = "iam-role-has-all-permissions"
}

resource "huaweicloud_rms_policy_assignment" "iam_role_has_all_permissions" {
  name                 = "iam-role-has-all-permissions"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.iam_role_has_all_permissions.definitions[0].id, "")
  status               = "Enabled"
}