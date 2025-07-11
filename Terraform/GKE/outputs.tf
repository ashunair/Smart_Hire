output "dev_cluster_name" {
  description = "The name of the dev cluster"
  value       = google_container_cluster.dev_cluster.name
}

output "prod_cluster_name" {
  description = "The name of the prod cluster"
  value       = google_container_cluster.prod_cluster.name
}
