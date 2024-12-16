resource "huaweicloud_aom_prom_instance" "this" {
  prom_name             = var.prometheus_name
  prom_type             = var.prometheus_type
  enterprise_project_id = var.enterprise_project_id
  prom_version          = var.prometheus_version
}

resource "huaweicloud_aom_cloud_service_access" "this" {
  for_each              = toset(var.connected_cloud_services)
  instance_id           = huaweicloud_aom_prom_instance.this.id
  service               = each.value
  tag_sync              = var.prometheus_tag_sync
  enterprise_project_id = var.enterprise_project_id
}