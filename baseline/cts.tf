resource "huaweicloud_identity_agency" "cts_admin_trust" {
  delegated_service_name = "op_svc_CTS"
  description            = "This Agency is required by CTS service"
  duration               = "FOREVER"
  name                   = "cts_admin_trust"

  all_resources_roles = ["KMS Administrator", "SMN Administrator", "OBS Administrator"]
}