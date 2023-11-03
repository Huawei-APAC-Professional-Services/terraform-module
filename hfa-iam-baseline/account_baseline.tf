resource "huaweicloud_identity_password_policy" "main" {
  password_char_combination             = var.password_combination
  minimum_password_length               = var.minimum_password_length
  number_of_recent_passwords_disallowed = var.password_reuse_limit
  password_validity_period              = var.password_validity_period
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
  type  = "console"

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

resource "huaweicloud_identity_protection_policy" "main" {
  protection_enabled = var.enable_protection
  verification_email = var.verification_email
  verification_mobile = var.verification_mobile
  self_management {
    access_key = var.aksk_selfmanagement
    password   = var.password_selfmanagement
    email      = var.allow_change_email
    mobile     = var.allow_change_mobile
  }
}