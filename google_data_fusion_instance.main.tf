resource "google_data_fusion_instance" "main" {
  name                          = var.name
  region                        = var.region
  type                          = var.type
  private_instance              = true
  enable_stackdriver_logging    = true
  enable_stackdriver_monitoring = true

  network_config {
    network       = var.network
    ip_allocation = var.ip_allocation
  }

  crypto_key_config {
    key_reference = var.crypto_key_reference
  }
}
