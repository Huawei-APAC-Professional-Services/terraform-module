resource "huaweicloud_identity_agency" "hfa_cts_log_transfer" {
  name                  = var.hfa_cts_log_transfer_agency_name
  description           = "Allow LTS send logs to security operation account"
  delegated_domain_name = var.hfa_log_account_name

  domain_roles = ["LTS Administrator"]
}

output "hfa_cts_log_transfer_agency_name" {
  value = huaweicloud_identity_agency.hfa_cts_log_transfer.name
}