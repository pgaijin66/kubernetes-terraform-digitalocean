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

variable "maintenance_start_time" {
  type = string
  description = "Time of the days where maintenance work can be done"
}

variable "maintenance_day" {
  type = string
  description = "Day of the week where maintenance work can be done"
}

variable "owner" {
  type = string
  description = "owner of the project"
}

variable "managed_by" {
  type = string
  description = "code managed by"
}
variable "env" {
  type = string
  description = "Environment"
}
variable "business_unit" {
  type = string
  description = "business unit that the project is related to"
}


