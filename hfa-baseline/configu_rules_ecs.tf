data "huaweicloud_rms_policy_definitions" "ecs_instance_key_pair_login" {
  name = "ecs-instance-key-pair-login"
}

resource "huaweicloud_rms_policy_assignment" "ecs_instance_key_pair_login" {
  name                 = "ecs-instance-key-pair-login"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.ecs_instance_key_pair_login.definitions[0].id, "")
  policy_filter {
    resource_provider = "ecs"
    resource_type     = "cloudservers"
  }
  status = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "ecs_instance_no_public_ip" {
  name = "ecs-instance-no-public-ip"
}

resource "huaweicloud_rms_policy_assignment" "ecs_instance_no_public_ip" {
  name                 = "ecs-instance-no-public-ip"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.ecs_instance_no_public_ip.definitions[0].id, "")
  policy_filter {
    resource_provider = "ecs"
    resource_type     = "cloudservers"
  }
  status = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "ecs_multiple_public_ip_check" {
  name = "ecs-multiple-public-ip-check"
}

resource "huaweicloud_rms_policy_assignment" "ecs_multiple_public_ip_check" {
  name                 = "ecs-multiple-public-ip-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.ecs_multiple_public_ip_check.definitions[0].id, "")
  policy_filter {
    resource_provider = "ecs"
    resource_type     = "cloudservers"
  }
  status = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "volume_unused_check" {
  name = "volume-unused-check"
}

resource "huaweicloud_rms_policy_assignment" "volume_unused_check" {
  name                 = "volume-unused-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.volume_unused_check.definitions[0].id, "")
  policy_filter {
    resource_provider = "evs"
    resource_type     = "volumes"
  }
  status = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "volumes_encrypted_check" {
  name = "volumes-encrypted-check"
}

resource "huaweicloud_rms_policy_assignment" "volumes_encrypted_check" {
  name                 = "volumes-encrypted-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.volumes_encrypted_check.definitions[0].id, "")
  policy_filter {
    resource_provider = "evs"
    resource_type     = "volumes"
  }
  status = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "sfsturbo_encrypted_check" {
  name = "sfsturbo-encrypted-check"
}

resource "huaweicloud_rms_policy_assignment" "sfsturbo_encrypted_check" {
  name                 = "sfsturbo-encrypted-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.sfsturbo_encrypted_check.definitions[0].id, "")
  policy_filter {
    resource_provider = "sfsturbo"
    resource_type     = "shares"
  }
  status = "Enabled"
}