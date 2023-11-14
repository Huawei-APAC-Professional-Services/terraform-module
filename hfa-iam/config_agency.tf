resource "huaweicloud_identity_agency" "hfa_config" {
  delegated_service_name = "op_svc_eps"
  description            = "Created by HFA. To ensure that services run properly, do not delete this agency."
  duration               = "FOREVER"
  name                   = "rms_custom_policy_agency"
  all_resources_roles = ["FunctionGraph FullAccess"]

  lifecycle {
    ignore_changes = [
      description
    ]
  }
}