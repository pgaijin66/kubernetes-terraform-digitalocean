resource "digitalocean_kubernetes_node_pool" "node_pool_2" {
  cluster_id = digitalocean_kubernetes_cluster.cluster.id

  name       = "nodepool-2"
  size       = ( var.node_size ? var.node_size : "s-1vcpu-2gb" )
  node_count = ( var.node_count ? var.node_count : 1 )
  tags       = concat(["nodepool-1"], local.tags)

  labels = {
    service  = "nodepool-2"
    priority = "high"
  }

  taint {
    key    = "workloadKind"
    value  = "database"
    effect = "NoSchedule"
  }
}