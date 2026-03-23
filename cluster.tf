data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_cloudwatch_log_group" "cluster" {
  name = "/aws/eks/${var.cluster_name}/cluster"
}

locals {
  cluster_oidc_issuer = replace(data.aws_eks_cluster.this.identity[0].oidc[0].issuer, "https://", "")
}

data "aws_iam_openid_connect_provider" "this" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}
