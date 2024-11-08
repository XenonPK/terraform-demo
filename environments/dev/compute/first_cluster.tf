locals {
  number_of_vms = 3
}

resource "azurerm_network_interface" "main-cluster" {
  count = local.number_of_vms

  name                = "${var.environment}-nic-${random_string.compute-identifier.result}-${count.index}"
  location            = azurerm_resource_group.compute-rg.location
  resource_group_name = azurerm_resource_group.compute-rg.name

  ip_configuration {
    name                          = "${var.environment}-dhcp-${random_string.compute-identifier.result}-${count.index}"
    subnet_id                     = data.azurerm_subnet.network["dnp-private-atvm"].id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "${var.environment}"
    terraform   = true
  }
}

resource "azurerm_virtual_machine" "main-cluster" {
  count = local.number_of_vms

  name                = "${var.environment}-vm-${random_string.compute-identifier.result}-${count.index}"
  location            = azurerm_resource_group.compute-rg.location
  resource_group_name = azurerm_resource_group.compute-rg.name

  network_interface_ids = [azurerm_network_interface.main-cluster[count.index].id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.environment}-vm-${random_string.compute-identifier.result}-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "${var.environment}"
    terraform   = true
  }
}
