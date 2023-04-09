resource "google_compute_network" "vpc_network" {
  project                 = "devsubba"  
  name                    = "${var.project_name}${var.environment}"
  auto_create_subnetworks = false
  mtu                     = 1460
}
resource "google_compute_subnetwork" "mumbai-subnet" {
  name          = "${var.project_name}${var.environment}"
  ip_cidr_range = "192.168.1.0/24"
  region        = "asia-south1"
  network       = google_compute_network.vpc_network.id
}
resource "google_compute_subnetwork" "us-subnet" {
  name          = "${var.project_name}${var.environment}"
  ip_cidr_range = "192.168.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}
resource "google_compute_firewall" "firewall-rule"{
    name = "test-firewall"
    network = google_compute_network.vpc_network.name
    allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "22", "443", "8080", "1000-2000"]
  }
  source_tags = ["dev"]

}