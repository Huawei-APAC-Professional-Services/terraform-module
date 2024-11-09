resource "huaweicloud_obs_bucket_policy" "this" {
  for_each = toset(var.bucket_policy)
  bucket   = huaweicloud_obs_bucket.this.id
  policy   = each.value
}