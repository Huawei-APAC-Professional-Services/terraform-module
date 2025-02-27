#resource "huaweicloud_cfw_acl_rule" "internet" {
#  name                = var.name
#  object_id           = [][0]
#  description         = var.description
#  type                = 0
#  address_type        = 0
#  action_type         = 0
#  long_connect_enable = 0
#  status              = 1
#
#  source_region_list {
#    description_cn = "中国"
#    description_en = "Chinese Mainland"
#    region_id      = "CN"
#    region_type    = 0
#  }
#
#  destination_addresses = ["1.1.1.2"]
#
#  custom_services {
#    protocol    = 6
#    source_port = 81
#    dest_port   = 82
#  }
#
#  sequence {
#    top = 1
#  }
#
#  tags = {
#    key = "value"
#  }
#}