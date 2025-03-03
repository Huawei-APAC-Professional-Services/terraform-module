resource "huaweicloud_cce_cluster" "this" {
  name                             = var.cluster_name
  alias                            = var.cluster_alias
  description                      = var.cluster_description
  cluster_type                     = var.cluster_type
  cluster_version                  = var.cluster_version
  flavor_id                        = var.cluster_flavor_id
  vpc_id                           = var.vpc_id
  subnet_id                        = var.node_subnet_id
  container_network_type           = var.container_network_type
  security_group_id                = var.node_security_group_id
  container_network_cidr           = var.container_network_cidr
  service_network_cidr             = var.service_network_cidr
  eni_subnet_id                    = var.eni_ipv4_subnet_id
  authentication_mode              = var.authentication_mode
  authenticating_proxy_ca          = var.authenticating_proxy_ca
  authenticating_proxy_cert        = var.authenticating_proxy_cert
  authenticating_proxy_private_key = var.authenticating_proxy_private_key
  multi_az                         = var.multi_az
  eip                              = var.api_eip_address
  kube_proxy_mode                  = var.kube_proxy_mode
  charging_mode                    = var.charging_mode
  period                           = var.period
  period_unit                      = var.period_unit
  tags                             = var.tags
}