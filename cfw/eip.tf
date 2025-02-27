#locals {
#  north_south_object_id = [for service in huaweicloud_cfw_firewall.this.protect_objects: service.object_id if service.type == 0]
#  east_west_object_id = [for service in huaweicloud_cfw_firewall.this.protect_objects: service.object_id if service.type == 1]
#}