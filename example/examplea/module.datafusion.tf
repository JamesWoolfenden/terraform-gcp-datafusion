# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "datafusion" {
  source        = "../../"
  name          = "example-instance"
  region        = "europe-west2"
  network       = google_compute_network.private.name
  ip_allocation = "10.92.48.0/22"
}
