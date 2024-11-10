resource "huaweicloud_css_cluster" "this" {
  name              = var.name
  engine_type       = var.engine_type
  engine_version    = var.engine_version
  security_mode     = var.security_mode
  password          = var.admin_password
  https_enabled     = var.https_enabled
  availability_zone = var.availability_zone
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  security_group_id = var.secgroup_id

  charging_mode = var.charging_mode
  period_unit   = var.period_unit
  period        = var.period


  dynamic "ess_node_config" {
    for_each = tomap(var.data_node_config)
    content {
      flavor          = ess_node_config.value.flavor
      instance_number = ess_node_config.value.instance_number
      volume {
        size        = ess_node_config.value.volume_size
        volume_type = ess_node_config.value.volume_type
      }
    }
  }

  dynamic "master_node_config" {
    for_each = var.master_node_config == null ? {} : tomap(var.master_node_config)
    content {
      flavor          = master_node_config.value["flavor"]
      instance_number = master_node_config.value["instance_number"]
      volume {
        size        = master_node_config.value["volume_size"]
        volume_type = master_node_config.value["volume_type"]
      }
    }
  }

  dynamic "client_node_config" {
    for_each = var.client_node_config == null ? {} : tomap(var.client_node_config)
    content {
      flavor          = client_node_config.value["flavor"]
      instance_number = client_node_config.value["instance_number"]
      volume {
        size        = client_node_config.value["volume_size"]
        volume_type = client_node_config.value["volume_type"]
      }
    }
  }

  dynamic "cold_node_config" {
    for_each = var.cold_node_config == null ? {} : tomap(var.cold_node_config)
    content {
      flavor          = cold_node_config.value["flavor"]
      instance_number = cold_node_config.value["instance_number"]
      volume {
        size        = cold_node_config.value["volume_size"]
        volume_type = cold_node_config.value["volume_type"]
      }
    }
  }

  dynamic "public_access" {
    for_each = var.public_access == null ? {} : tomap(var.public_access)
    content {
      bandwidth         = public_access.value["bandwidth"]
      whitelist_enabled = public_access.value["whitelist_enabled"]
      whitelist         = public_access.value["whitelist_cidrs"]
    }
  }

  dynamic "kibana_public_access" {
    for_each = var.kibana_public_access == null ? {} : tomap(var.kibana_public_access)
    content {
      bandwidth         = kibana_public_access.value.bandwidth
      whitelist_enabled = kibana_public_access.value.whitelist_enabled
      whitelist         = kibana_public_access.value.whitelist_cidrs
    }
  }

  dynamic "backup_strategy" {
    for_each = var.backup_strategy == null ? {} : tomap(var.backup_strategy)
    content {
      start_time  = backup_strategy.value["start_time"]
      keep_days   = backup_strategy.value["keep_days"]
      prefix      = backup_strategy.value["prefix"]
      bucket      = backup_strategy.value["bucket"]
      backup_path = backup_strategy.value["backup_path"]
      agency      = backup_strategy.value["agency"]
    }
  }

  dynamic "vpcep_endpoint" {
    for_each = var.vpcep_endpoint == null ? {} : tomap(var.vpcep_endpoint)
    content {
      endpoint_with_dns_name = vpcep_endpoint.value["endpoint_with_dns_name"]
      whitelist              = vpcep_endpoint.value["whitelist"]
    }
  }
}