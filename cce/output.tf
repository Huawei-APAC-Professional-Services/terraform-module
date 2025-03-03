output "cluster_api_server_private" {
  value = [for c in huaweicloud_cce_cluster.this.certificate_clusters : c.server if c.name == "internalCluster"][0]
}

output "cluster_api_server_public" {
  value = [for c in huaweicloud_cce_cluster.this.certificate_clusters : c.server if c.name == "externalCluster"][0]
}

output "cluster_ca_certificate" {
  value = [for c in huaweicloud_cce_cluster.this.certificate_clusters : c.certificate_authority_data if c.name == "externalClusterTLSVerify"][0]
}

output "cluster_client_key" {
  value = [for u in huaweicloud_cce_cluster.this.certificate_users : u.client_certificate_data if u.name == "user"][0]
}

output "cluster_client_certificate" {
  value = [for u in huaweicloud_cce_cluster.this.certificate_users : u.client_key_data if u.name == "user"][0]
}

output "kuber_config" {
  value = huaweicloud_cce_cluster.this.kube_config_raw
}