resource "huaweicloud_cts_tracker" "this" {
  bucket_name          = var.cts_bucket_name
  file_prefix          = var.cts_log_file_prefix
  lts_enabled          = var.cts_lts_enabled
  organization_enabled = var.organization_enabled
  validate_file        = var.validation_enabled
  kms_id               = var.cts_kms_id
  is_sort_by_service   = var.is_sort_by_service
  exclude_service      = var.excluded_service
  enabled              = var.cts_enabled
  tags                 = var.tags
  delete_tracker       = var.deltetion_enabled
}

data "huaweicloud_cts_trackers" "system" {
  tracker_id = huaweicloud_cts_tracker.this.id
}