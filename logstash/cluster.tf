resource "huaweicloud_css_logstash_cluster" "this" {
  name           = var.name
  engine_version = var.engine_version
  charging_mode = var.charging_mode
  period_unit = var.period_unit
  period = var.period

  availability_zone = var.availability_zone
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  security_group_id = var.secgroup_id

  dynamic node_config {
    for_each = var.node_config
    content {
        flavor          = node_config.value["flavor"]
        instance_number = node_config.value["instance_number"]
        volume {
            volume_type = node_config.value["volume_type"]
            size        = node_config.value["volume_size"]
        }
    }
  }

  dynamic routes {
    for_each = var.routes
    content {
        ip_address = routes.value["ip_address"]
        ip_net_mask = routes.value["ip_net_mask"]
    }
  }

  tags = var.tags
}