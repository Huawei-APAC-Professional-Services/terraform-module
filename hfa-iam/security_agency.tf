resource "huaweicloud_identity_agency" "hfa_security_admin" {
  name                  = var.hfa_security_admin_agency_name
  description           = "Allow Security Team to view all resources in a member account and configure security features"
  delegated_domain_name = var.hfa_iam_account_name

  domain_roles = ["Tenant Guest","LTS FullAccess","CTS FullAccess","Security Administrator"]
}

output "hfa_security_admin_agency_id" {
  value = huaweicloud_identity_agency.hfa_security_admin.id
}