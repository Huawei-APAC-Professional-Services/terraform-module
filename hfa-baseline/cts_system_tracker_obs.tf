resource "huaweicloud_cts_tracker" "system_tracker" {
  for_each = var.hfa_regions
  region = each.value
  bucket_name = var.cts_bucket_name
}

resource "huaweicloud_smn_topic" "hfa_cts_topic" {
  name                     = "hfa_cts_topic"
  display_name             = "hfa_cts_topic"
  services_publish_allowed = "cts"
  introduction             = "created by hfa"
}