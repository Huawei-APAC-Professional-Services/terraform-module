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
  name        = "agent-${var.instance_name_suffix}"
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

resource "huaweicloud_compute_instance" "main" {
  name               = "agent-${var.instance_name_suffix}"
  image_id           = data.huaweicloud_images_image.main.id
  flavor_id          = data.huaweicloud_compute_flavors.main.ids[0]
  key_pair           = var.keypair_name
  user_data          = var.user_data
  security_group_ids = [huaweicloud_networking_secgroup.main.id]
  availability_zone  = var.availability_zone

  network {
    uuid = var.subnet_id
  }
}

resource "huaweicloud_vpc_eip" "main" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "agent_${var.instance_name_suffix}"
    size        = 100
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "huaweicloud_compute_eip_associate" "associated" {
  public_ip   = huaweicloud_vpc_eip.main.address
  instance_id = huaweicloud_compute_instance.main.id
}