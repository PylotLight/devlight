# Configure the Google Cloud Platform Provider
provider "google" {
  credentials = var.GOOGLE_CREDENTIALS
  project     = var.GCP_Project
  region      = var.GCP_Region
  zone        = var.GCP_Zone
}

resource "google_compute_network" "vpc" {
  name = "devlight-vpc"
}

resource "google_compute_instance" "vm_instance" {
  name         = "linstance"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20220406"
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
    access_config {
    }
  }
}

