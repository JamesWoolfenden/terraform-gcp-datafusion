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

variable "type" {
  type        = string
  description = "Data Fusion instance tier"
  default     = "BASIC"

  validation {
    condition     = contains(["BASIC", "ENTERPRISE", "DEVELOPER"], var.type)
    error_message = "var.type must be one of BASIC, ENTERPRISE, DEVELOPER"
  }
}

variable "crypto_key_reference" {
  type        = string
  description = "The resource name of the KMS crypto key used to encrypt/decrypt data in the Data Fusion instance. The expected format is: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}"
  sensitive   = true

  validation {
    condition     = length(trimspace(var.crypto_key_reference)) > 0
    error_message = "var.crypto_key_reference must be a non-empty string"
  }
}