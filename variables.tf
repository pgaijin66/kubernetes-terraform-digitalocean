variable "do_token" {
  type        = string
  description = "Digital ocean api token passed via env vars"
}

variable "cluster_name" {
  type        = string
  description = "DOKS cluster name"
}

variable "cluster_region" {
  type        = string
  description = "DOKS cluster name"
}

variable "auto_upgrade" {
  type = bool
  description = "Auto upgrade"
}

variable "node_size" {
  type = string
  description = "Size of each node in a node pool"
}

variable "node_count" {
  type = number
  description = "number of nodes in each node pool"
}



