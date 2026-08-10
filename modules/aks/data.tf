data "azurerm_key_vault_secret" "ClientID" {
  name         = "externalDnsClientID"
  key_vault_id = "/subscriptions/e890e2a1-2eca-4c0b-8e51-dd98c583dd43/resourceGroups/devops-practiece/providers/Microsoft.KeyVault/vaults/burlash"
}

data "azurerm_key_vault_secret" "ClientPassword" {
  name         = "ExternalDnsClientPassword"
  key_vault_id = "/subscriptions/e890e2a1-2eca-4c0b-8e51-dd98c583dd43/resourceGroups/devops-practiece/providers/Microsoft.KeyVault/vaults/burlash"
}

data "azurerm_key_vault_secret" "PrometheusClientID" {
  name         = "PrometheusClientID"
  key_vault_id = "/subscriptions/e890e2a1-2eca-4c0b-8e51-dd98c583dd43/resourceGroups/devops-practiece/providers/Microsoft.KeyVault/vaults/burlash"
}

data "azurerm_key_vault_secret" "PrometheusClientPassword" {
  name         = "PrometheusClientPassword"
  key_vault_id = "/subscriptions/e890e2a1-2eca-4c0b-8e51-dd98c583dd43/resourceGroups/devops-practiece/providers/Microsoft.KeyVault/vaults/burlash"
}

data "azurerm_key_vault_secret" "ExternalSecretClientID" {
  name         = "externalSecretClientID"
  key_vault_id = "/subscriptions/e890e2a1-2eca-4c0b-8e51-dd98c583dd43/resourceGroups/devops-practiece/providers/Microsoft.KeyVault/vaults/burlash"
}

data "azurerm_key_vault_secret" "ExternalSecretClientPassword" {
  name         = "ExternalSecretClientPassword"
  key_vault_id = "/subscriptions/e890e2a1-2eca-4c0b-8e51-dd98c583dd43/resourceGroups/devops-practiece/providers/Microsoft.KeyVault/vaults/burlash"
}