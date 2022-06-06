resource "azurerm_network_interface" "opstree_nic1" {
  name                = var.opstree_nic1
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "opstree_nic1_ip"
    subnet_id                     =  azurerm_subnet.opstree_subnet[count.index]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.opstreepip.id
  }
}