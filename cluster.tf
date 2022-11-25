resource "digitalocean_kubernetes_cluster" "cluster" {
  name   = ( var.cluster_name ? var.cluster_name : "doks_cluster")
  region = ( var.cluster_region ? var.cluster_region : "sgp1" )
  # Grab the latest version slug from `doctl kubernetes options versions`
  auto_upgrade = ( var.auto_upgrade ? true : false )
  version      = data.digitalocean_kubernetes_versions.version.latest_version

  maintenance_policy {
    start_time = ( var.maintenance_start_time ? var.maintenance_start_time : "04:00" )
    day        = ( var.maintenance_day ? var.maintenance_day : "sunday" )
  }

  node_pool {
    name       = "nodepool-1"
    size       = var.node_size
    node_count = var.node_count
    tags       = concat(["nodepool-1"], local.tags)

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
