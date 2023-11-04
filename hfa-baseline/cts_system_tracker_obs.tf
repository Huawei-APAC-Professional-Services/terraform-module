resource "huaweicloud_cts_tracker" "system_tracker" {
  for_each = var.hfa_cts_regions
  region = each.key
  bucket_name = each.value
}

resource "huaweicloud_smn_topic" "hfa_cts_topic" {
  name                     = "hfa_cts_topic"
  display_name             = "hfa_cts_topic"
  services_publish_allowed = "cts"
  introduction             = "created by hfa"
}