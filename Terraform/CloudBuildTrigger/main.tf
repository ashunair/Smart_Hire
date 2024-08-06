terraform {
  backend "gcs" {
    bucket = "terraform-state-backkup"  # Replace with your bucket name
    prefix = "terraform/state/build"          # Optional: Directory inside the bucket
  }
}

provider "google" {
  project = "smarthirehub-429323"
  region  = "global"
}

# Define the Cloud Build trigger
resource "google_cloudbuild_trigger" "hrsystem-trigger" {
  name        = "hrsystem-trigger"
  filename    = "cloudbuild.yaml"
  description = "Cloud build trigger"
  location    = "global"

  github {
    owner = "faiza293"
    name  = "hiring_system"
    push {
      branch = ".*"  # Matches any branch
    }
  }
}
