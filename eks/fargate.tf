resource "aws_eks_fargate_profile" "main" {
  cluster_name           = aws_eks_cluster.main.name
  fargate_profile_name   = "${var.common_tags["env"]}-${var.common_tags["proj"]}-${var.eks_name}-fp"
  pod_execution_role_arn = aws_iam_role.fmain.arn
  subnet_ids             = var.subnet_ids

  selector {
    namespace = "default"
  }
  selector {
    namespace = "kube-system"
  }
}

resource "aws_iam_role" "fmain" {
  name = "${var.common_tags["env"]}-${var.common_tags["proj"]}-${var.eks_name}-fp"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks-fargate-pods.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "main-AmazonEKSFargatePodExecutionRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.fmain.name
}