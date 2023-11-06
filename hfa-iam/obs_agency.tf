resource "huaweicloud_identity_agency" "hfa_obs_replication" {
  delegated_service_name = "op_svc_obs"
  description            = "Created by HFA. To ensure that services run properly, do not delete this agency."
  duration               = "FOREVER"
  name                   = var.obs_cross_region_replication_name

  all_resources_roles = ["OBS Administrator", "KMS Administrator"]

  lifecycle {
    ignore_changes = [
      description
    ]
  }
}

output "hfa_obs_replication_agency_name" {
  value = huaweicloud_identity_agency.hfa_obs_replication.name
}