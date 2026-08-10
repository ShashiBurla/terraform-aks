provider "azurerm" {
  features {}
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.112.0"
    }
  }
}

# terraform {
#   backend "azurerm" {}
# }

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}
