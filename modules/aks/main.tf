resource "azurerm_kubernetes_cluster" "main" {
  name                = "roboshop-${var.env}"
  location            = var.rg_location
  resource_group_name = var.rg_name
  dns_prefix          = "roboshop-${var.env}"
  kubernetes_version = "1.35.4"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
    vnet_subnet_id = var.subnet_id
  }
  
  #  network_profile {
  #   network_plugin     = "azure"
  #   service_cidr       = "10.1.0.0/16"       # <-- change to non-overlapping range
  #   dns_service_ip     = "10.1.0.10"         # <-- must be inside service_cidr
  # }
   network_profile {
    network_policy = "azure"
    network_plugin = "azure"
  }

  # # Defines the node provisioning profile behavior
  # node_provisioning_profile {
  #   mode              = "Auto"
  # }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [default_node_pool]
  }

}

resource "azurerm_role_assignment" "registry" {
  principal_id                     = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = "/subscriptions/e890e2a1-2eca-4c0b-8e51-dd98c583dd43/resourceGroups/devops-practiece/providers/Microsoft.ContainerRegistry/registries/burlash"
  skip_service_principal_aad_check = true
}

# Use this command to get the kubeconfig
# az aks get-credentials --resource-group devops-practiece --name roboshop-dev
# az aks get-credentials -g devops-practiece -n roboshop-dev --overwrite-existing
resource "azurerm_kubernetes_cluster_node_pool" "pool1" {
  name                  = "pool1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id
  vm_size               = "Standard_D2s_v3"
  vnet_subnet_id        = var.subnet_id

  node_count           = 4
  auto_scaling_enabled = true
  min_count            = 4
  max_count            = 20

  lifecycle {
    ignore_changes = [upgrade_settings]
  }

}