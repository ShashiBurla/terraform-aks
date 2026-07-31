resource "azurerm_network_interface" "main" {
  count               = var.vm_count
  name                = "${var.component_name}-${var.env}-nic${count.index}"
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "${var.component_name}-${var.env}-nic${count.index}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  count                           = var.vm_count
  name                            = "${var.component_name}-${var.env}-${count.index}"
  location                        = var.location
  resource_group_name             = var.rgname
  network_interface_ids           = [azurerm_network_interface.main[count.index].id]
  size                            = var.vm_size
  admin_password                  = "Shashi@80999"
  admin_username                  = "burlash"
  source_image_id                 = var.image_id
  disable_password_authentication = false
  secure_boot_enabled             = true
  vtpm_enabled                    = true

  user_data = base64encode(templatefile("${path.root}/userdata.sh", {
    component_name = var.component_name
    env            = var.env
  }))

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

resource "azurerm_dns_a_record" "main" {
  name                = "${var.component_name}-${var.env}"
  zone_name           = "shashidevops.online"
  resource_group_name = var.rgname
  ttl                 = 30
  records             = [azurerm_network_interface.main[0].private_ip_address]
}
