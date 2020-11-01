variable "virtual_network_name" {
  default = ""
}

variable "resource_group_name" {
  default = ""
}


variable "subnet_id" {
  default = ""
}

variable "sku" {
  default = "standard"
}

variable "location" {
  description = "North Europe"
  default = "North Europe"
}

variable "site" {
  default     = "test"
  description = "An optional prefix to use in naming schemes"
}

variable "environment" {
  default     = ""
  description = "An environment might have implications on naming schemes, or deployment options."
}

variable "application" {
  default     = ""
  description = "Application name for naming schemes, or deployment options."
}

variable "network_security_group_id" {
  default = ""
}

variable "tags" {
  type    = map
  default = {
    "CostCenter" = "00000"
    "Project" = "TEST"
  }
  description = "A mapping of tags to assign to the resource. For instance business stakeholders, or who pays for it?"
}

variable "initial_count" {
  description = "Specify the number of vm instances"
  default     = ""
}

variable "user_object_id" {
  default = ""
}

variable "objectpermission_map" {
  type = list(object({
    object_id = string 
    permissions = string
  }))
  default = []
}