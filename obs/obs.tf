resource "huaweicloud_obs_bucket" "this" {
  bucket        = var.name
  acl           = var.acl
  policy        = var.bucket_policy
  policy_format = var.policy_format
  storage_class = var.storage_class
  versioning    = var.enable_versioning

  dynamic "logging" {
    for_each = var.logging
    content {
      target_bucket = logging.value["target_bucket"]
      target_prefix = logging.value["target_prefix"]
      agency        = logging.value["agency"]
    }
  }

  dynamic "website" {
    for_each = var.website
    content {
      index_document = website.value.index_document
      error_document = website.value.error_document
      routing_rules  = website.value.routing_rules
    }
  }

  dynamic "cors_rule" {
    for_each = var.cors_rule
    content {
      allowed_origins = cors_rule.value["allowed_origins"]
      allowed_methods = cors_rule.value["allowed_methods"]
      allowed_headers = cors_rule.value["allowed_headers"]
      expose_headers  = cors_rule.value["expose_headers"]
      max_age_seconds = cors_rule.value["max_age_seconds"]
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule
    content {
      name    = lifecycle_rule.value.name
      enabled = lifecycle_rule.enabled
      prefix  = lifecycle_rule.prefix

      dynamic "expiration" {
        for_each = lifecycle_rule.value.retention_days
        content {
          days = expiration.value
        }
      }
    }
  }

  quota         = var.bucket_quota
  multi_az      = var.multi_az_enabled
  encryption    = var.encryption_enabled
  sse_algorithm = var.sse_algorithm
  kms_key_id    = var.kms_id

  tags = var.tags
}