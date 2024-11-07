resource "huaweicloud_obs_bucket" "this" {
  count         = var.create_cts_bucket ? 1 : 0
  bucket        = var.cts_bucket_name
  acl           = "private"
  storage_class = var.cts_bucket_storage_class
  versioning    = var.cts_bucket_enable_versioning
  lifecycle_rule {
    name    = "retention"
    enabled = true

    expiration {
      days = var.cts_bucket_log_retention_period
    }
    abort_incomplete_multipart_upload {
      days = 30
    }
  }
  multi_az      = true
  encryption    = true
  sse_algorithm = var.cts_bucket_sse_algorithm
  kms_key_id    = var.cts_encryption_kms_id

  tags = var.cts_bucket_tags
}