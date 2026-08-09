output "id" {
  value       = google_data_fusion_instance.main.id
  description = "ID of the Data Fusion instance"
}

output "service_endpoint" {
  value       = google_data_fusion_instance.main.service_endpoint
  description = "Endpoint on which the Data Fusion UI and REST APIs are accessible"
}

output "api_endpoint" {
  value       = google_data_fusion_instance.main.api_endpoint
  description = "Endpoint for REST API access"
}

output "p4_service_account" {
  value       = google_data_fusion_instance.main.p4_service_account
  description = "Data Fusion service agent email; grant this roles/cloudkms.cryptoKeyEncrypterDecrypter on the CMEK key referenced by var.crypto_key_reference"
}
