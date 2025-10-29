output "gke_endpoint" {
  value = google_container_cluster.gke.endpoint
}

output "bucket_name" {
  value = google_storage_bucket.artifacts.name
}

