resource "google_compute_network" "private" {
  name                    = "datafusion-private"
  auto_create_subnetworks = false
}
