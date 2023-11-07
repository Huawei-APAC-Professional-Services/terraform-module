data "huaweicloud_account" "current" {}

locals {
  createkmsrole = data.huaweicloud_account.current.name == var.hfa_centralized_iam_account ? 1 : 0
}

resource "huaweicloud_identity_role" "kms_role" {
  count       = local.createkmsrole
  name        = "hfa_terraform_kms"
  description = "Created for hfa workshop"
  type        = "AX"
  policy      = jsonencode(file("kms_policy.json"))
}