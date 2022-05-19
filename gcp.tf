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