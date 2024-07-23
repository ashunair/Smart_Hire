resource "google_artifact_registry_repository" "smart_hire" {
  location      = "us-central1"
  repository_id = "smart-hire"
  description   = "docker repository"
  format        = "DOCKER"
}