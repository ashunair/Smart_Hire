terraform {
  backend "gcs" {
    bucket  = "terraform-state-backkup"  # Replace with your bucket name
    prefix  = "terraform/state"          # Optional: Directory inside the bucket
  }
}

resource "google_artifact_registry_repository" "hiringsystem-repo" {
  location      = "us-central1"
  repository_id = "hiringsystem-repo"
  description   = "docker repository"
  format        = "DOCKER"
}
