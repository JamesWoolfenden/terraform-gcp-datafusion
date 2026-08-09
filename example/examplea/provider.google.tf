# holden:ignore:HLD_GCP_059 — per-repo WIF SA with attribute.repository scoping
# provides equivalent least-privilege without impersonation.
provider "google" {
  default_labels = {
    "owner"    = "holden"
    module     = "terraform-gcp-datafusion"
    created_by = "terraform"
  }
}

# google_project_service_identity requires the google-beta provider
provider "google-beta" {
  default_labels = {
    "owner"    = "holden"
    module     = "terraform-gcp-datafusion"
    created_by = "terraform"
  }
}
