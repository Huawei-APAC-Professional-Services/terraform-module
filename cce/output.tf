output "cluster_api_server_private" {
  value = [for s in huaweicloud_cce_cluster.this.certificate_clusters : s.server if s.name == "internalCluster"][0]
}

output "cluster_api_server_public" {
  value = [for s in huaweicloud_cce_cluster.this.certificate_clusters : s.server if s.name == "externalCluster"][0]
}

output "cluster_ca_certificate" {
  value = [for s in huaweicloud_cce_cluster.this.certificate_clusters : s.certificate_authority_data if s.name == "externalClusterTLSVerify"][0]
}

output "cluster_client_key" {
  value = [for u in huaweicloud_cce_cluster.this.certificate_users : s.client_certificate_data if s.name == "user"][0]
}

output "cluster_client_certificate" {
  value = [for u in huaweicloud_cce_cluster.this.certificate_users : s.client_key_data if s.name == "user"][0]
}