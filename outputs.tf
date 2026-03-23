output "cluster_logs_group" {
  value       = data.aws_cloudwatch_log_group.cluster.name
  description = "string ||| The name of the Cloudwatch log group containing EKS Control Plane logs."
}

output "cluster_arn" {
  value       = data.aws_eks_cluster.this.arn
  description = "string ||| AWS Arn for EKS cluster."
}

output "cluster_name" {
  value       = data.aws_eks_cluster.this.name
  description = "string ||| Name of the EKS cluster."
}

output "cluster_endpoint" {
  value       = data.aws_eks_cluster.this.endpoint
  description = "string ||| Endpoint address for EKS cluster."
}

output "cluster_ca_certificate" {
  value       = data.aws_eks_cluster.this.certificate_authority[0].data
  description = "string ||| Base64-encoded certificate to connect to cluster."
}

output "cluster_oidc_issuer" {
  value       = local.cluster_oidc_issuer
  description = "string ||| Cluster certificate issuer used by OpenID Connect Provider"
}

output "cluster_openid_provider_arn" {
  value       = data.aws_iam_openid_connect_provider.this.arn
  description = "string ||| ARN of the OpenID Connect Provider that is used to provide IAM roles with Kubernetes Service Accounts"
}
