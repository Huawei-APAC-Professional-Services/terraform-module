resource "huaweicloud_organizations_policy" "disable_eip" {
  name = "disable_network_services"
  type     = "service_control_policy"
  content = jsonencode(file("disable_network_services.json"))
}