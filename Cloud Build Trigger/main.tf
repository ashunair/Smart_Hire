provider "google" {
  project = "regal-scholar-423322-h0"
  region  = "global"
}

# Define the Cloud Build trigger
resource "google_cloudbuild_trigger" "smart-hire-system-trigger" {
  name        = "smart-hire-system-trigger"
  description = "Cloud build trigger"

  trigger_template {
    project_id  = "regal-scholar-423322-h0"
    repo_name   = "smart-hire"
    branch_name = ".*"  # Matches any branch
  }

  filename = "cloudbuild.yaml"

}

