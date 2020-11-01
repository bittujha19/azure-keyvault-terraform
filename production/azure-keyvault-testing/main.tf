
terraform {
  backend "azurerm" {
    storage_account_name = "STORAGEACCCOUNTNAME"
    container_name       = "terraform"
    resource_group_name  = "test-rg-001"
    key                  = "keyvault-automation-test.terraform.tfstate"
  }
}

module "kv" {
  source = "../../modules/keyvault"
  resource_group_name = "${var.resource_group_name}"
  application = "${var.application}"
  tags = var.tags
  site = "${var.site}"
  location = "${var.location}"
  environment = "${var.environment}"
  initial_count = "${var.initial_count}"
  subnet_id = "${var.subnet_id}"
  network_security_group_id = "${var.network_security_group_id}"
  objectpermission_map = jsondecode(file("user-input.json"))
}