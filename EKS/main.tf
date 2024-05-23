module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks-cluster-vpc"
  cidr = var.cidr

  azs             = data.aws_availability_zones.azs.names
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true



  tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }
  public_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"               = 1

  }
  private_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/private_elb"       = 1

  }
}

## eks module

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                   = "mayank-eks-cluster"
  cluster_version                = "1.29"
  cluster_endpoint_public_access = true
  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets

  eks_managed_node_groups = {
    nodes = {
      instance_types = var.instance_types

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }
  }
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
