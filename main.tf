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
    machine_type = "e2-micro"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

# Define the stage cluster
resource "google_container_cluster" "stage_cluster" {
  name     = "stage-cluster"
  location = var.zone

  initial_node_count = 1

  node_config {
    machine_type = "e2-micro"

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
    machine_type = "e2-micro"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

# Define IAM policy for Cloud Deploy pipeline editor
resource "google_project_iam_member" "cloud_deploy_pipeline_editor" {
  project = var.project_id
  role    = "roles/clouddeploy.editor"
  member  = "serviceAccount:${google_service_account.cloud_deploy_sa.email}"
}

# Define IAM policy for Cloud Deploy rollout permissions
resource "google_project_iam_member" "cloud_deploy_rollout_permissions" {
  project = var.project_id
  role    = "roles/clouddeploy.jobRunner"
  member  = "serviceAccount:${google_service_account.cloud_deploy_sa.email}"
}

# Define the service account for Cloud Deploy
resource "google_service_account" "cloud_deploy_sa" {
  account_id   = "cloud-deploy-sa"
  display_name = "Cloud Deploy Service Account"
}
