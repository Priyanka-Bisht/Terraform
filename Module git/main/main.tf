module "resource_group" {
  source = "../resource_group"
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "vnet" {
  source = "../vnet"
  vnet_name = var.vnet_name
  vnet_address = var.vnet_address
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  subnet_prefix = var.subnet_prefix
  subnet_name  = var.subnet_name
  depends_on = [
  module.resource_group
]

}
