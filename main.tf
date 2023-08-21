terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}


resource "azurerm_resource_group" "resource_group" {
  name     = var.nome
  location = var.location
  tags     = local.common_tags
}


resource "azurerm_virtual_network" "virtual_network" {
  name                = var.nome
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = ["10.0.0.0/16"]

  tags = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.nome
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  name                    = var.nome
  location                = azurerm_resource_group.resource_group.location
  resource_group_name     = azurerm_resource_group.resource_group.name
  allocation_method       = "Static"
  idle_timeout_in_minutes = 30

  tags = local.common_tags
}

resource "azurerm_network_interface" "nic-vm1" {
  name                = var.nome
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = var.nome
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = local.common_tags
}

resource "azurerm_network_security_group" "nsg-vm1" {
  name                = var.nome
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.common_tags
}


resource "azurerm_network_interface_security_group_association" "nic_to_nsg" {
  network_interface_id      = azurerm_network_interface.nic-vm1.id
  network_security_group_id = azurerm_network_security_group.nsg-vm1.id
}

resource "azurerm_linux_virtual_machine" "vm1" {
  name                  = var.nome
  location              = azurerm_resource_group.resource_group.location
  resource_group_name   = azurerm_resource_group.resource_group.name
  network_interface_ids = [azurerm_network_interface.nic-vm1.id]
  size                  = var.sizevm
  admin_username        = var.user-vm1

  admin_ssh_key {
    username   = var.user-vm1
    public_key = file("~/.ssh/julianorib.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  tags = local.common_tags
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.vm1.public_ip_addresses
}