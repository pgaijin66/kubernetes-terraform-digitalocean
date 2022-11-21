
data "digitalocean_kubernetes_versions" "version" {}


resource "digitalocean_kubernetes_cluster" "cluster" {
  name   = var.cluster_name
  region = var.cluster_region
  # Grab the latest version slug from `doctl kubernetes options versions`
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.version.latest_version

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = "frontend-pool"
    size       = var.node_size
    node_count = var.node_count
    tags       = ["frontend"]

    labels = {
      service  = "frontend"
      priority = "high"
    }

    taint {
      key    = "workloadKind"
      value  = "database"
      effect = "NoSchedule"
    }
  }
}

resource "digitalocean_kubernetes_node_pool" "backend_pool" {
  cluster_id = digitalocean_kubernetes_cluster.cluster.id

  name       = "backend-pool"
  size       = var.node_size
  node_count = var.node_count
  tags       = ["backend"]

  labels = {
    service  = "backend"
    priority = "high"
  }

  taint {
    key    = "workloadKind"
    value  = "database"
    effect = "NoSchedule"
  }
}