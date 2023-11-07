resource "huaweicloud_identity_user" "enterprise_administrator" {
  name      = var.huaweicloud_account_name
  password  = var.enterprise_administrator_password
  email     = var.enterprise_administrator_email
  pwd_reset = var.enterprise_administrator_require_password_reset
}

output "enterprise_administrator_passwordp" {
  value = var.enterprise_administrator_password
}