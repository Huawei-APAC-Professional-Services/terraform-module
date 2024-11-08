resource "huaweicloud_kms_key" "this" {
  key_alias         = var.alias
  is_enabled        = var.enabled
  key_algorithm     = var.algorithm
  key_usage         = var.type
  key_description   = var.description
  origin            = var.key_source
  keystore_id       = var.keystore_id
  rotation_enabled  = var.rotation_enabled
  rotation_interval = var.rotation_interval
  pending_days      = "7"
  tags              = var.tags
}