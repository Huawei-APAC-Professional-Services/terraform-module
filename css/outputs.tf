output "data_nodes" {
  value = [for node in huaweicloud_css_cluster.this.nodes : node.ip if node.type == "ess"]
}

output "ess_master_nodes" {
  value = [for node in huaweicloud_css_cluster.this.nodes : node.ip if node.type == "ess-master"]
}

output "ess_client_nodes" {
  value = [for node in huaweicloud_css_cluster.this.nodes : node.ip if node.type == "ess-client"]
}

output "ess_cold_nodes" {
  value = [for node in huaweicloud_css_cluster.this.nodes : node.ip if node.type == "ess-cold"]
}