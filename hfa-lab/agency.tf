resource "huaweicloud_identity_agency" "hfa_iam_base" {
  name                  = "hfa_iam_base"
  description           = "Allow centralized IAM account to manage IAM resources in all accounts"
  delegated_domain_name = var.hfa_centralized_iam_account

  all_resources_roles = ["Security Administrator"]
}