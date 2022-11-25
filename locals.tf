# populate the list of tags to be applied to the worker nodes
locals {
  tags = toset([
    var.owner,
    var.env,
    var.business_unit,
    var.managed_by
  ])
}