output "name" {
  value       = helm_release.csi-secrets-store.name
  description = "the name of the release"

}

output "chart" {
  value       = helm_release.csi-secrets-store.chart
  description = "the name of the chart"

}

output "namespace" {
  value       = helm_release.csi-secrets-store.namespace
  description = "the kubernetes namespace of the release"

}