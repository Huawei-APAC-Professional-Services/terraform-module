resource "huaweicloud_identity_agency" "rms_tracker_agency" {
  delegated_service_name = "op_svc_eps"
  description            = "Created by HFA. To ensure that services run properly, do not delete this agency."
  duration               = "FOREVER"
  name                   = "rms_tracker_agency"

  all_resources_roles = ["OBS Administrator", "SMN Administrator"]

  lifecycle {
    ignore_changes = [
      description
    ]
  }
}

output "rms_tracker_agency_id" {
  value = huaweicloud_identity_agency.rms_tracker_agency.id
}

output "rms_tracker_agency_name" {
  value = huaweicloud_identity_agency.rms_tracker_agency.name
}