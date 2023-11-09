resource "huaweicloud_cts_tracker" "system_tracker" {
  for_each      = var.hfa_cts_regions_obs_config
  region        = each.key
  bucket_name   = each.value
  validate_file = true
  lts_enabled   = var.hfa_cts_lts_enabled
}

resource "huaweicloud_smn_topic" "hfa_cts_topic" {
  for_each                 = var.hfa_cts_regions_obs_config
  region                   = each.key
  name                     = var.hfa_cts_smn_topic_name
  display_name             = var.hfa_cts_smn_topic_display_name
  services_publish_allowed = "cts"
  introduction             = "created for hfa"
}

data "huaweicloud_identity_group" "admin" {
  name = "admin"
}

