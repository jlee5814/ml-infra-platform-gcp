terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# ---- Network ----
resource "google_compute_network" "vpc" {
  name                    = "ml-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "ml-subnet"
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.0.0/16"
}

# ---- Storage ----
resource "google_storage_bucket" "artifacts" {
  name     = "${var.project_id}-artifacts"
  location = var.region
}

# ---- GKE Cluster ----
resource "google_container_cluster" "gke" {
  name     = "ml-gke"
  location = var.region
  network  = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.subnet.id

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary" {
  name       = "ml-gke-pool"
  location   = var.region
  cluster    = google_container_cluster.gke.name

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  initial_node_count = 2
}

