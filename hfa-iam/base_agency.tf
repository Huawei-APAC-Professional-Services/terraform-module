resource "huaweicloud_identity_agency" "hfa_base" {
  name                  = var.hfa_base_agency_name
  description           = "Allow infra team to configure all basic resources in a member account"
  delegated_domain_name = var.hfa_iam_account_name

  all_resources_roles = ["OBS Administrator", "IAM ReadOnlyAccess", "CTS Administrator", "SMN Administrator","RMS FullAccess"]
}

output "hfa_base_agency_id" {
  value = huaweicloud_identity_agency.hfa_base.id
}

output "hfa_base_agency_name" {
  value = huaweicloud_identity_agency.hfa_base.name
}