output "ecs_id" {
  value = huaweicloud_compute_instance.this.id
}

output "ecs_private_ipv4_address" {
  value = huaweicloud_compute_instance.this.access_ip_v4
}