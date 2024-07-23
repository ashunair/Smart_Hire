provider "google" {
  project = var.project
  region  = var.region
}

resource "google_clouddeploy_delivery_pipeline" "hiring-system-app" {
  name        = var.pipeline_name
  description = var.pipeline_description
  location    = var.region

  serial_pipeline {
    stages {
      target_id = "staging"
    }
    stages {
      target_id = "prod"
    }
  }
}

resource "google_clouddeploy_target" "staging" {
  name        = "staging"
  description = "staging cluster"
  location    = var.region
  gke {
    cluster = var.staging_cluster
  }
}

resource "google_clouddeploy_target" "prod" {
  name              = "prod"
  description       = "prod cluster"
  location    = var.region
  require_approval  = true
  gke {
    cluster = var.prod_cluster
  }
}
