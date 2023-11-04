resource "huaweicloud_cts_tracker" "system_tracker" {
  for_each = var.hfa_cts_regions
  region = each.key
  bucket_name = each.value
}

resource "huaweicloud_smn_topic" "hfa_cts_topic" {
  for_each = var.hfa_cts_regions
  region = each.key
  name                     = var.hfa_cts_smn_topic_name
  display_name             = var.hfa_cts_smn_topic_display_name
  services_publish_allowed = "cts"
  introduction             = "created for hfa"
}