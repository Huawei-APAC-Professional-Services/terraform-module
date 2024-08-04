locals {
  image_id = var.image_id != "" ? var.image_id : data.huaweicloud_images_image.this[0].id
}

data "huaweicloud_images_image" "this" {
  count        = var.image_name == "" ? 0 : 1
  name         = var.image_name
  visibility   = var.image_visibility
  architecture = var.image_architecture
  most_recent  = true
}

resource "huaweicloud_compute_instance" "this" {
  name               = var.ecs_name
  image_id           = local.image_id
  flavor_id          = var.flavor_id
  security_group_ids = var.secgroup_ids
  availability_zone  = var.availability_zone

  system_disk_type       = var.system_disk_type
  system_disk_size       = var.system_disk_size
  system_disk_iops       = var.system_disk_iops
  system_disk_kms_key_id = var.kms_key_id
  system_disk_throughput = var.system_disk_throughput

  dynamic "data_disks" {
    for_each = var.data_disks == null ? [] : var.data_disks
    content {
      type        = data_disks.value["disk_type"]
      size        = data_disks.value["disk_size"]
      snapshot_id = data_disks.value["snapshot_id"]
      kms_key_id  = data_disks.value["kms_key_id"]
      iops        = data_disks.value["iops"]
      throughput  = data_disks.value["throughput"]
    }
  }
  delete_disks_on_termination = var.delete_disks_on_termination

  dynamic "network" {
    for_each = var.networks
    content {
      uuid              = network.value["subnet_id"]
      fixed_ip_v4       = network.value["fixed_ip_v4"]
      ipv6_enable       = network.value["ipv6_enable"]
      source_dest_check = network.value["source_dest_check"]
      access_network    = network.value["access_network"]
    }
  }

  eip_id                    = var.eip_id
  delete_eip_on_termination = var.delete_eip_on_termination

  admin_pass  = var.admin_pass
  key_pair    = var.key_pair_name
  user_data   = var.user_data
  agent_list  = var.agent_list
  tags        = var.tags
  agency_name = var.agency_name
}