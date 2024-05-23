data "aws_availability_zones" "azs" {}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = module.eks.cluster_name
  depends_on = [module.eks]
}

output "eks_cluster_id" {
  value = data.aws_eks_cluster.cluster.id
}

output "eks_cluster_name" {
  value = data.aws_eks_cluster.cluster.name
}


