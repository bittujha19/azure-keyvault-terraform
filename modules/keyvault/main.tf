provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

data "azurerm_client_config" "current" {}

// local 
locals {
  permission_map = {
    viewer = ["list","get"]
    editor = ["list","get","delete"]
    admin = ["list","get","create"]
  }
}

resource "azurerm_key_vault" "keyvault" {
  count                       = var.initial_count 
  name                        = "${var.site}-akv-${var.environment}-${var.application}-0${count.index+1}" // 24 characters 
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = var.sku

  dynamic "access_policy" {
    for_each = var.objectpermission_map
    content {
      tenant_id = data.azurerm_client_config.current.tenant_id
      object_id = access_policy.value["object_id"]
      key_permissions = lookup(local.permission_map,access_policy.value["permissions"],[])
      secret_permissions = lookup(local.permission_map,access_policy.value["permissions"],[])
      storage_permissions = lookup(local.permission_map,access_policy.value["permissions"],[])
    }
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = var.tags  
}