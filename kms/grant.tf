resource "huaweicloud_kms_grant" "this" {
  for_each           = toset(var.grantees)
  key_id             = huaweicloud_kms_key.this.key_id
  type               = each.value["type"]
  grantee_principal  = each.value["grantee_principal"]
  operations         = each.value["operations"]
  retiring_principal = each.value["retiring_principal"]
}