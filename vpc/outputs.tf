output "vpc_id" {
  value = huaweicloud_vpc.this.id
}

output "subnets" {
  value = { for k, v in huaweicloud_vpc_subnet.this : k => v.id }
}

output "ipv4_subnets" {
  value = { for k, v in huaweicloud_vpc_subnet.this : k => v.ipv4_subnet_id }
}