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
  win_nic_name = "win-nic01"
  app_subnetid = module.virtualnetwork.app_subnetid_output
  linux_nic_name = "linux-001"
  db_subnetid = module.virtualnetwork.db_subnet_output
  win_pip_id = module.publicip.win_pip_id_output
  linux_pip_id = module.publicip.linux_pip_id_output
  }


module "publicip" {
  source = "./puplicip"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  win_pip_name = "win-pip001"
  linux_pip_name = "linux-pip001"
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
  source = "./win_virtualmachine"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  win_vm_name = "Win-srv"
  win_nic_id = module.networkcard.win_nic_id_output
}

module "linuxsrv" {
  source = "./Linux_vm"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  linux_vm_name = "linux-srv"
  linux_nic_id = module.networkcard.linux_nic_id_output
}