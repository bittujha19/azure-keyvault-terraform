variable "resource_group_name" {
  default = "test-rg-001"
}

variable "application" {
  default     = "testing"
  description = "Application name for naming schemes, or deployment options."
}


variable "tags" {
  type    = map
  default = {
    "environment" = "testing-todelete" 
    "CostCenter" = "00000"
    "Project" = "TEST"
  }
  description = "A mapping of tags to assign to the resource. For instance business stakeholders, or who pays for it?"
}

variable "site" {
  default     = "test"
  description = "An optional prefix to use in naming schemes"
}

variable "location" {
  description = "North Europe"
  default = "North Europe"
}

variable "environment" {
  default     = "test"
  description = "An environment"
}

variable "initial_count" {
  description = "Specify the number of vm instances"
  default     = "1"
}

variable "subnet_id" {
  default = ""
}

variable "network_security_group_id" {
  default = ""
}

variable "subscription_id" {
    default = ""
}

variable "client_id" {
    default = ""
}

variable "client_secret" {
    default = ""
}

variable "tenant_id" {
    default = ""
}

// variable "user_permissions" {
//   default = {}
// }