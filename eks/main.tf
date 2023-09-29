resource "aws_eks_cluster" "main" {
  name     = "${var.common_tags["env"]}-${var.common_tags["proj"]}-${var.eks_name}"
  role_arn = aws_iam_role.main.arn
  version = var.eks_version
  

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.main-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.main-AmazonEKSVPCResourceController,
  ]
}

resource "aws_eks_addon" "coredns" {
    depends_on = [ resource.aws_eks_fargate_profile.main ]
  cluster_name                = aws_eks_cluster.main.name
  addon_name                  = "coredns"
  addon_version               = "v1.10.1-eksbuild.3" 
  resolve_conflicts_on_update = "OVERWRITE"
  resolve_conflicts_on_create = "OVERWRITE"
  
  configuration_values = jsonencode({
    computeType = "fargate"
  })
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name                = aws_eks_cluster.main.name
  addon_name                  = "kube-proxy"
  addon_version               = "v1.27.4-eksbuild.2" 
  resolve_conflicts_on_update = "OVERWRITE"
  resolve_conflicts_on_create = "OVERWRITE"

}

resource "aws_eks_addon" "vpc-cni" {
  cluster_name                = aws_eks_cluster.main.name
  addon_name                  = "vpc-cni"
  addon_version               = "v1.14.1-eksbuild.1" 
  resolve_conflicts_on_update = "OVERWRITE"
  resolve_conflicts_on_create = "OVERWRITE"
  configuration_values = jsonencode({
    enableNetworkPolicy = "true"
  })

}


