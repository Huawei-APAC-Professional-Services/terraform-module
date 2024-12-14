resource "huaweicloud_identity_password_policy" "this" {
  password_char_combination             = var.password_combination
  minimum_password_length               = var.minimum_password_length
  number_of_recent_passwords_disallowed = var.password_reuse_limit
  maximum_consecutive_identical_chars   = var.consecutive_character_allowed
  password_validity_period              = var.password_validity_period
  minimum_password_age                  = var.minimum_password_age
  password_not_username_or_invert       = var.not_allow_username_as_password
}

resource "huaweicloud_identity_login_policy" "this" {
  account_validity_period    = var.account_allowed_inactive_days
  lockout_duration           = var.account_lockout_time
  login_failed_times         = var.allowed_login_attempts
  period_with_login_failures = var.login_attempts_tally_window
  session_timeout            = var.session_timeout
  show_recent_login_info     = var.display_last_login_info
  custom_info_for_login      = var.login_banner
}

resource "huaweicloud_identity_protection_policy" "this" {
  protection_enabled  = var.operation_protection_enabled
  verification_email  = var.operation_protection_third_party_email
  verification_mobile = var.operation_protection_third_party_mobile
  dynamic "self_management" {
    for_each = tomap(var.iam_user_self_management)
    content {
      access_key = self_management.value["access_key"]
      password   = self_management.value["password"]
      email      = self_management.value["email"]
      mobile     = self_management.value["mobile"]
    }
  }
}

resource "huaweicloud_identity_acl" "console" {
  count = (length(var.console_acl_ip_cidrs) == 0) && (length(var.console_acl_ip_ranges) == 0) ? 0 : 1
  type  = "console"

  dynamic "ip_cidrs" {
    for_each = var.console_acl_ip_cidrs
    content {
      cidr = ip_cidrs.value
    }
  }

  dynamic "ip_ranges" {
    for_each = var.console_acl_ip_ranges
    content {
      range = ip_ranges.value
    }
  }
}

resource "huaweicloud_identity_acl" "api" {
  count = (length(var.api_acl_ip_cidrs) == 0) && (length(var.api_acl_ip_ranges) == 0) ? 0 : 1
  type  = "api"

  dynamic "ip_cidrs" {
    for_each = var.console_acl_ip_cidrs
    content {
      cidr = ip_cidrs.value
    }
  }
  dynamic "ip_ranges" {
    for_each = var.api_acl_ip_ranges
    content {
      range = ip_ranges.value
    }
  }
}