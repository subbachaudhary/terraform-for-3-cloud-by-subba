resource "azurerm_resource_group" "vpc-resource" {
  name     = "${var.project_name}${var.environment}"
  location = "${var.region}"
}

resource "azurerm_network_security_group" "vpc-security" {
  name                = "example-security-group"
  location            = azurerm_resource_group.vpc-resource.location
  resource_group_name = azurerm_resource_group.vpc-resource.name
}

resource "azurerm_virtual_network" "my-network" {
  name                = "${var.project_name}${var.environment}"
  location            = azurerm_resource_group.vpc-resource.location
  resource_group_name = azurerm_resource_group.vpc-resource.name
  address_space       = var.address_space
  dns_servers         = ["192.168.0.1", "192.168.0.2"]
  tags = {
    environment = "Dev"
  }
}
resource "azurerm_subnet" "mysubvnet" {
  name                 = "first-subnet"
  resource_group_name  = azurerm_resource_group.vpc-resource.name
  virtual_network_name = azurerm_virtual_network.my-network.name
  address_prefixes     = ["192.168.1.0/24"]
}
resource "azurerm_subnet" "us-subnet" {
  name                 = "second-subnet"
  resource_group_name  = azurerm_resource_group.vpc-resource.name
  virtual_network_name = azurerm_virtual_network.my-network.name
  address_prefixes     = ["192.168.2.0/24"]
}