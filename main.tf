module "db" {
  source = "./modules/vm"

  for_each       = var.db
  component_name = each.key
  vm_size        = try(each.value["vm_size"], "Standard_B1s")

  rgname    = var.rgname
  location  = var.location
  image_id  = var.image_id
  env       = var.env
  subnet_id = var.subnet_id
  vm_count  = 1
}


module "aks" {
  source = "./modules/aks"
  env    = var.env
  subnet_id = var.subnet_id
  rg_name     = var.rgname
  rg_location = var.location
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
}
 