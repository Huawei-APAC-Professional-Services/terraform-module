resource "huaweicloud_identity_user" "this" {
  name        = var.name
  description = var.user_description
  password    = var.password
}