module "resourcegroup" {
  source = "./resourcegroup"
  resourcegroup_name = "terraform-01"
  location = "East Asia"
}

module "storageaccount" {
    #count = 3
  source = "./storageaccount"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  storageaccount_name = "stacc"
}
/*
resource "azurerm_management_lock" "storage_lock" {
  name       = "storage-lock"
  scope      = module.storageaccount.storage_id
  lock_level = "CanNotDelete"
  notes      = "Locked because it's needed by a third-party"
}
*/

module "virtualnetwork" {
  source = "./network"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  vent_name = "demo-subnet"
  app_subnet = "app-subnet"
  db_subnet = "db-subnet"
}

module "networkcard" {
  source = "./interfacecard"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  nic_name = "demo-nic01"
  app_subnetid = module.virtualnetwork.app_subnetid_output
  pip_id = module.publicip.pip_id_output
  }


module "publicip" {
  source = "./puplicip"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  pip_name = "demo-pip001"
}

/*
resource "azurerm_management_lock" "pip_lock" {
  name       = "pip-lock"
  scope      = module.publicip.pip_id_output
  lock_level = "CanNotDelete"
  notes      = "Locked because it's needed by a third-party"
}
*/

module "nsg" {
  source = "./securitygroup"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  app_subnetid = module.virtualnetwork.app_subnetid_output
  nsg_name = "demo-nsg01"
}

module "winsrv" {
  source = "./virtualmachine"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
}