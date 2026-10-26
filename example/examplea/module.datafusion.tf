# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
# holden:ignore:HLD_TF_065 — intentionally thin: module owns the resource + typed variable validation; network/KMS prerequisites (PSA peering, service identity, KMS IAM grant) stay outside so they don't collide if this module is later called with for_each across multiple instances sharing one VPC
module "datafusion" {
  source               = "../../"
  name                 = "example-instance"
  region               = "europe-west2"
  network              = google_compute_network.private.name
  ip_allocation        = "10.92.48.0/22"
  crypto_key_reference = google_kms_crypto_key.datafusion.id

  depends_on = [
    google_kms_crypto_key_iam_member.datafusion,
    google_service_networking_connection.datafusion,
  ]
}

resource "google_compute_global_address" "datafusion_psa_range" {
  name          = "datafusion-psa-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  address       = "10.92.48.0"
  prefix_length = 22
  network       = google_compute_network.private.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_service_networking_connection" "datafusion" {
  network                 = google_compute_network.private.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.datafusion_psa_range.name]
}

data "google_project" "current" {}

resource "google_project_service_identity" "datafusion" {
  provider = google-beta
  project  = data.google_project.current.project_id
  service  = "datafusion.googleapis.com"
}

resource "google_kms_crypto_key_iam_member" "datafusion" {
  crypto_key_id = google_kms_crypto_key.datafusion.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${google_project_service_identity.datafusion.email}"
}

resource "google_kms_crypto_key" "datafusion" {
  name            = "datafusion-key"
  key_ring        = google_kms_key_ring.datafusion.name
  rotation_period = "100000s"
  destroy_scheduled_duration = "2592000s"
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_key_ring" "datafusion" {
  name     = "datafusion-keyring"
  location = "europe-west2"
}
