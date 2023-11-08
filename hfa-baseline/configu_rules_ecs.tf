data "huaweicloud_rms_policy_definitions" "ecs_instance_key_pair_login" {
  name         = "ecs-instance-key-pair-login"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "ecs_instance_key_pair_login" {
  name                 = "ecs-instance-key-pair-login"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.ecs_instance_key_pair_login.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "ecs_instance_no_public_ip" {
  name         = "ecs-instance-no-public-ip"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "ecs_instance_no_public_ip" {
  name                 = "ecs-instance-no-public-ip"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.ecs_instance_no_public_ip.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "ecs_multiple_public_ip_check" {
  name         = "ecs-multiple-public-ip-check"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "ecs_multiple_public_ip_check" {
  name                 = "ecs-multiple-public-ip-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.ecs_multiple_public_ip_check.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "volume_unused_check" {
  name         = "volume-unused-check"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "volume_unused_check" {
  name                 = "volume-unused-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.volume_unused_check.definitions[0].id, "")
  status               = "Enabled"
}

data "huaweicloud_rms_policy_definitions" "volumes_encrypted_check" {
  name         = "volumes-encrypted-check"
  policy_type  = "builtin"
  trigger_type = "resource"
}

resource "huaweicloud_rms_policy_assignment" "volumes_encrypted_check" {
  name                 = "volumes-encrypted-check"
  policy_definition_id = try(data.huaweicloud_rms_policy_definitions.volumes_encrypted_check.definitions[0].id, "")
  status               = "Enabled"
}