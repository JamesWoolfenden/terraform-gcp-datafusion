variable "name" {
  type        = string
  description = "Name of the Data Fusion instance"

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "var.name must be a non-empty string"
  }
}

variable "region" {
  type        = string
  description = "Region for the Data Fusion instance"

  validation {
    condition     = length(trimspace(var.region)) > 0
    error_message = "var.region must be a non-empty string"
  }
}

variable "network" {
  type        = string
  description = "Name of the VPC network for private instance peering"

  validation {
    condition     = length(trimspace(var.network)) > 0
    error_message = "var.network must be a non-empty string"
  }
}

variable "ip_allocation" {
  type        = string
  description = "CIDR range allocated for Data Fusion's private peering"

  validation {
    condition     = length(trimspace(var.ip_allocation)) > 0
    error_message = "var.ip_allocation must be a non-empty string"
  }
}
