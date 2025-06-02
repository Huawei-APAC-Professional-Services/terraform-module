resource "huaweicloud_dms_kafka_instance" "this" {
  name              = var.name
  vpc_id            = var.vpc_id
  network_id        = var.subnet_id
  security_group_id = var.security_group_id

  flavor_id          = data.huaweicloud_dms_kafka_flavors.test.flavor_id
  storage_spec_code  = data.huaweicloud_dms_kafka_flavors.test.flavors[0].ios[0].storage_spec_code
  availability_zones = var.availability_zones
  engine_version     = "2.7"
  storage_space      = 600
  broker_num         = 3

  ssl_enable  = true
  access_user = "user"
  password    = var.access_password

  parameters {
    name  = "min.insync.replicas"
    value = "2"
  }
}