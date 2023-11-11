data "huaweicloud_rms_policy_definitions" "rds_instance_no_public_ip" {
  name = "rds-instance-no-public-ip"
}

resource "huaweicloud_rms_policy_assignment" "rds_instance_no_public_ip" {
  name                 = "rds-instance-no-public-ip"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.rds_instance_no_public_ip.definitions[0].id, "")
  policy_filter {
    resource_provider = "rds"
    resource_type     = "instances"
  }
  status = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "rds_instances_enable_kms" {
  name = "rds-instances-enable-kms"
}

resource "huaweicloud_rms_policy_assignment" "rds_instances_enable_kms" {
  name                 = "rds-instances-enable-kms"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.rds_instances_enable_kms.definitions[0].id, "")
  policy_filter {
    resource_provider = "rds"
    resource_type     = "instances"
  }
  status = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "rds_instance_enable_backup" {
  name = "rds-instance-enable-backup"
}

resource "huaweicloud_rms_policy_assignment" "rds_instance_enable_backup" {
  name                 = "rds-instance-enable-backup"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.rds_instance_enable_backup.definitions[0].id, "")
  policy_filter {
    resource_provider = "rds"
    resource_type     = "instances"
  }
  status = "Enabled"
}