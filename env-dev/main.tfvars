env       = "dev"
location  = "Denmark East"
rgname    = "devops-practiece"
image_id  = "/subscriptions/e890e2a1-2eca-4c0b-8e51-dd98c583dd43/resourceGroups/devops-practiece/providers/Microsoft.Compute/galleries/rhel10.1/images/1.0.0"
subnet_id = "/subscriptions/e890e2a1-2eca-4c0b-8e51-dd98c583dd43/resourceGroups/devops-practiece/providers/Microsoft.Network/virtualNetworks/terraform-vnet/subnets/default"
db = {
  mysql = {
    vm_size = "Standard_B1ms"
  }
  valkey = {}
  mongodb = {
    vm_size = "Standard_B1ms"
  }
  rabbitmq = {}
}