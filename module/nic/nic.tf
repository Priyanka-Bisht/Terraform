resource "azurerm_network_interface" "nics" {
  count             = length(var.nics)
  name              = var.nics[count.index]
  location          = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name            = var.ip_config_name[count.index]
    subnet_id       = element(azurerm_subnet.test[*].id, count.index % 2)
    private_ip_address_allocation = "Dynamic"
    private_ip_address = element(var.nics, count.index)
    public_ip_address_id = element(azurerm_public_ip.opstreepip[*].id, count.index)
  }
  depends_on = [
    azurerm_subnet.subnets
  ]
}