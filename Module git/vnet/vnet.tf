
resource "azurerm_virtual_network" "opstree_vnet" {
  name                = var.vnet_name[count.index]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_address[count.index]]
  count               = "${length(var.vnet_name)}"

}

resource "azurerm_subnet" "test" {
  name                 = var.subnet_name[count.index]
  resource_group_name  = var.resource_group_name
  virtual_network_name =  var.vnet_name[count.index]
  address_prefix       = "${element(var.subnet_prefix, count.index)}"
  count                = "${length(var.subnet_prefix)}"
  depends_on = [
  azurerm_virtual_network.opstree_vnet
]
}
