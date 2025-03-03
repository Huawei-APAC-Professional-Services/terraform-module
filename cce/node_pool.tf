resource "huaweicloud_cce_node_pool" "this" {
  for_each                 = { for pool in var.node_pools : pool.name => pool }
  cluster_id               = huaweicloud_cce_cluster.this.id
  name                     = each.value.name
  initial_node_count       = each.value.initial_node_count
  flavor_id                = each.value.flavor_id
  type                     = each.value.type
  availability_zone        = each.value.availability_zone
  os                       = each.value.os
  key_pair                 = each.value.key_pair
  password                 = each.value.password
  subnet_id                = each.value.subnet_id
  ecs_group_id             = each.value.ecs_group_id
  extend_params            = each.value.extend_params
  scall_enable             = true
  min_node_count           = 1
  max_node_count           = 10
  scale_down_cooldown_time = 100
  priority                 = 1

  root_volume {
    size       = 40
    volumetype = "SAS"
  }

  data_volumes {
    size       = 100
    volumetype = "SAS"
  }
}