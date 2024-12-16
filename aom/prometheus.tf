resource "huaweicloud_aom_prom_instance" "this" {
  for_each              = { for instance in var.prometheus_instances : instance.name => instance }
  prom_name             = each.value["name"]
  prom_type             = each.value["type"]
  enterprise_project_id = each.value["enterprise_project_id"]
  prom_version          = each.value["version"]
}