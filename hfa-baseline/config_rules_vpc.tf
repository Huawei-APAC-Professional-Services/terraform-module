data "huaweicloud_rms_policy_definitions" "vpc_acl_unused_check" {
  name         = "vpc-acl-unused-check"
}

resource "huaweicloud_rms_policy_assignment" "vpc_acl_unused_check" {
  name                 = "vpc-acl-unused-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.vpc_acl_unused_check.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "vpc_sg_restricted_ssh" {
  name         = "vpc-sg-restricted-ssh"
}

resource "huaweicloud_rms_policy_assignment" "vpc_sg_restricted_ssh" {
  name                 = "vpc-sg-restricted-ssh"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.vpc_sg_restricted_ssh.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "vpc_default_sg_closed" {
  name         = "vpc-default-sg-closed"
}

resource "huaweicloud_rms_policy_assignment" "vpc_default_sg_closed" {
  name                 = "vpc-default-sg-closed"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.vpc_default_sg_closed.definitions[0].id, "")
  status               = "Enabled"
}