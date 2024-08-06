provider "google" {
  project = var.project_id
  region  = var.region
}

# Define the dev cluster
resource "google_container_cluster" "dev_cluster" {
  name     = "dev-cluster"
  location = var.zone

  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 10

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

# Define the prod cluster
resource "google_container_cluster" "prod_cluster" {
  name     = "prod-cluster"
  location = var.zone

  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 10

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}