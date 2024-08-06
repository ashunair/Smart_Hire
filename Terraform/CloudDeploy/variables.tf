variable "project" {
  description = "The ID of the project in which to create the pipeline and targets."
  type        = string
}

variable "region" {
  description = "The region in which to create the pipeline and targets."
  type        = string
  default     = "us-central1"
}

variable "pipeline_name" {
  description = "The name of the delivery pipeline."
  type        = string
}

variable "pipeline_description" {
  description = "The description of the delivery pipeline."
  type        = string
  default     = "hrsystem-pipeline"
}

variable "staging_cluster" {
  description = "The GKE cluster URL for the staging environment."
  type        = string
}

variable "prod_cluster" {
  description = "The GKE cluster URL for the prod environment."
  type        = string
}
