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

resource "huaweicloud_aom_multi_account_aggregation_rule" "this" {
  count       = var.enabled_cross_account_aggregation_rule ? 1 : 0
  instance_id = huaweicloud_aom_prom_instance.this.id

  dynamic "accounts" {
    for_each = var.accounts_list
    content {
      id   = each.value["account_id"]
      name = each.value["account_name"]
    }
  }

  services {
    service = "SYS.ELB"
    metrics = [
      "huaweicloud_sys_elb_m1_cps",
      "huaweicloud_sys_elb_m2_act_conn",
    ]
  }
}