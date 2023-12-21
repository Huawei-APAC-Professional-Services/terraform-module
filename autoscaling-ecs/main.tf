data "huaweicloud_compute_flavors" "main" {
  availability_zone = var.availability_zone
  performance_type  = var.performance_type
  cpu_core_count    = var.cpu_count
  memory_size       = var.memory_size
}

data "huaweicloud_images_image" "main" {
  name        = var.image_name
  most_recent = true
}

resource "huaweicloud_networking_secgroup" "main" {
  name        = var.resource_name
  description = "allow agent to access internet"
}

resource "huaweicloud_networking_secgroup_rule" "allow_ssh" {
  security_group_id = huaweicloud_networking_secgroup.main.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_as_configuration" "ecs" {
  scaling_configuration_name = var.resource_name

  instance_config {
    flavor             = data.huaweicloud_compute_flavors.main.ids[0]
    image              = data.huaweicloud_images_image.main.id
    key_name           = var.keypair_name
    security_group_ids = [huaweicloud_networking_secgroup.main.id]
    user_data          = var.user_data

    disk {
      size        = 80
      volume_type = "SSD"
      disk_type   = "SYS"
    }

    public_ip {
      eip {
        ip_type = "5_bgp"
        bandwidth {
          share_type    = "PER"
          charging_mode = "traffic"
          size          = var.eip_bandwidth
        }
      }
    }
  }
}

resource "huaweicloud_as_group" "ecs_as_group" {
  scaling_group_name       = var.resource_name
  scaling_configuration_id = huaweicloud_as_configuration.ecs.id
  desire_instance_number   = 2
  min_instance_number      = 0
  max_instance_number      = 10
  vpc_id                   = var.vpc_id
  delete_publicip          = true
  delete_instances         = "yes"
  agency_name              = var.agency_name

  networks {
    id = var.subnet_id
  }
}