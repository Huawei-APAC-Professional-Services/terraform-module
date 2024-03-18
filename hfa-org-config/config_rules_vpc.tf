data "huaweicloud_rms_policy_definitions" "vpc_acl_unused_check" {
  name = "vpc-acl-unused-check"
}

resource "huaweicloud_rms_organizational_policy_assignment" "vpc_acl_unused_check" {
  organization_id      = local.organization_id
  name                 = "vpc-acl-unused-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.vpc_acl_unused_check.definitions[0].id, "")
  policy_filter {
    resource_provider = "vpc"
    resource_type     = "firewallGroups"
  }
  status = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "vpc_sg_restricted_ssh" {
  name = "vpc-sg-restricted-ssh"
}

resource "huaweicloud_rms_organizational_policy_assignment" "vpc_sg_restricted_ssh" {
  organization_id      = local.organization_id
  name                 = "vpc-sg-restricted-ssh"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.vpc_sg_restricted_ssh.definitions[0].id, "")
  policy_filter {
    resource_provider = "vpc"
    resource_type     = "securityGroups"
  }
  status = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "vpc_default_sg_closed" {
  name = "vpc-default-sg-closed"
}

resource "huaweicloud_rms_organizational_policy_assignment" "vpc_default_sg_closed" {
  organization_id      = local.organization_id
  name                 = "vpc-default-sg-closed"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.vpc_default_sg_closed.definitions[0].id, "")
  policy_filter {
    resource_provider = "vpc"
    resource_type     = "securityGroups"
  }
  status = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "vpc_flow_logs_enabled" {
  name = "vpc-flow-logs-enabled"
}

resource "huaweicloud_rms_organizational_policy_assignment" "vpc_flow_logs_enabled" {
  organization_id      = local.organization_id
  name                 = "vpc-flow-logs-enabled"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.vpc_flow_logs_enabled.definitions[0].id, "")
  policy_filter {
    resource_provider = "vpc"
    resource_type     = "flowLogs"
  }
  status = "Enabled"
}