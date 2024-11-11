output "data_nodes" {
  value = [for node in huaweicloud_css_cluster.this.nodes : node.ip if node.type == "ess indicates"]
}