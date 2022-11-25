
data "digitalocean_kubernetes_versions" "version" {}


resource "digitalocean_kubernetes_cluster" "cluster" {
  name   = var.cluster_name
  region = var.cluster_region
  # Grab the latest version slug from `doctl kubernetes options versions`
  auto_upgrade = var.auto_upgrade
  version      = data.digitalocean_kubernetes_versions.version.latest_version

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = "nodepool-1"
    size       = var.node_size
    node_count = var.node_count
    tags       = ["nodepool-1"]

    labels = {
      service  = "nodepool-1"
      priority = "high"
    }

    taint {
      key    = "workloadKind"
      value  = "database"
      effect = "NoSchedule"
    }
  }
}

resource "digitalocean_kubernetes_node_pool" "node_pool_2" {
  cluster_id = digitalocean_kubernetes_cluster.cluster.id

  name       = "nodepool-2"
  size       = var.node_size
  node_count = var.node_count
  tags       = ["nodepool-2"]

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