resource "aws_eks_access_entry" "self" {
  count = var.skip_self_access ? 0 : 1

  cluster_name  = data.aws_eks_cluster.this.name
  principal_arn = local.self_arn
}

resource "aws_eks_access_policy_association" "self_admin" {
  count = var.skip_self_access ? 0 : 1

  cluster_name  = data.aws_eks_cluster.this.name
  principal_arn = local.self_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}

resource "aws_eks_access_entry" "ns_agent" {
  cluster_name  = data.aws_eks_cluster.this.name
  principal_arn = local.ns_agent_user_arn
}

resource "aws_eks_access_policy_association" "ns_agent_admin" {
  cluster_name  = data.aws_eks_cluster.this.name
  principal_arn = local.ns_agent_user_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}
