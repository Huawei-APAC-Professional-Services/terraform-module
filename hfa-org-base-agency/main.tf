resource "huaweicloud_identity_agency" "rms_tracker_agency" {
  delegated_service_name = "op_svc_eps"
  description            = "Created by HFA. To ensure that services run properly, do not delete this agency."
  duration               = "FOREVER"
  name                   = "rms_tracker_agency"

  all_resources_roles = ["OBS OperateAccess", "SMN Administrator"]

  lifecycle {
    ignore_changes = [
      description
    ]
  }
}

resource "huaweicloud_identity_agency" "cts_admin_trust" {
  delegated_service_name = "op_svc_CTS"
  description            = "Created by HFA. To ensure that services run properly, do not delete this agency."
  duration               = "FOREVER"
  name                   = "cts_admin_trust"
  project_role {
    project = "ap-southeast-3"
    roles = [
      "KMS Administrator",
      "SMN Administrator",
      "OBS Administrator"
    ]
  }
  all_resources_roles = ["KMS Administrator", "SMN Administrator", "OBS Administrator"]

  lifecycle {
    ignore_changes = [
      description
    ]
  }
}

resource "huaweicloud_identity_agency" "cloud_resource_management_agency" {
  count                 = var.cloud_resource_management_account_name != "" ? 1 : 0
  name                  = var.Cloud_resource_management_agency_name
  description           = "manage all resource on behalf of enterprise administrator"
  delegated_domain_name = var.cloud_resource_management_account_name

  all_resources_roles = ["Security Administrator", "FullAccess", "Tenant Administrator"]
}