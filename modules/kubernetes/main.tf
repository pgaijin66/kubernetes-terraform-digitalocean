
data "digitalocean_kubernetes_versions" "version" {}


resource "digitalocean_kubernetes_cluster" "sfo3" {
  name   = "doks-sof3"
  region = "sfo3"
  # Grab the latest version slug from `doctl kubernetes options versions`
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.version.latest_version

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = "frontend-pool"
    size       = "s-1vcpu-2gb"
    node_count = 1
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
  cluster_id = digitalocean_kubernetes_cluster.sfo3.id

  name       = "backend-pool"
  size       = "s-1vcpu-2gb"
  node_count = 1
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