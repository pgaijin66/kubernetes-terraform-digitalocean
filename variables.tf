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
  default = false
  type = bool
  description = "Auto upgrade"
}

variable "node_size" {
  type = string
  description = "Size of each node in a node pool"
}

variable "node_count" {
  default = 1
  type = number
  description = "number of nodes in each node pool"
}

variable "maintenance_start_time" {
  default = "04:00"
  type = string
  description = "Time of the days where maintenance work can be done"
}

variable "maintenance_day" {
  default = "sunday"
  type = string
  description = "Day of the week where maintenance work can be done"
}



