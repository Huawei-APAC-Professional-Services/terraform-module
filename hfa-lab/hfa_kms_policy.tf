data "huaweicloud_account" "current" {}

locals {
  createkmsrole = data.huaweicloud_account.current.name == var.hfa_centralized_iam_account ? 1 : 0
}

resource "huaweicloud_identity_role" "kms_role" {
  count       = local.createkmsrole
  name        = "hfa_terraform_kms"
  description = "Created for hfa workshop"
  type        = "AX"
  policy = jsonencode({
    "Version" : "1.1",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "kms:dek:encrypt",
          "kms:cmk:getMaterial",
          "kms:cmk:create",
          "kms:grant:retire",
          "kms:cmk:getRotation",
          "kms:cmkTag:create",
          "kms:cmk:decrypt",
          "kms:partition:create",
          "kms:cmk:update",
          "kms:cmk:get",
          "kms:dek:create",
          "kms:partition:list",
          "kms:partition:get",
          "kms:grant:revoke",
          "kms:cmk:encrypt",
          "kms:cmk:getQuota",
          "kms:cmk:list",
          "kms:cmk:getInstance",
          "kms:cmk:generate",
          "kms:cmk:verify",
          "kms:cmk:crypto",
          "kms:cmk:sign",
          "kms:dek:crypto",
          "kms:dek:decrypt",
          "kms:grant:create",
          "kms:grant:list",
          "kms:cmk:deleteMaterial",
          "kms:cmk:getPublicKey",
          "kms:cmkTag:list",
          "kms:cmk:enable"
        ]
      }
    ]
  })
}