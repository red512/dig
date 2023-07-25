module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "main"
  cidr = "10.0.0.0/20"

  azs             = ["us-east-1a", "us-east-1c"]
  private_subnets = ["10.0.0.0/22", "10.0.32.0/22"]
  public_subnets  = ["10.0.64.0/22", "10.0.96.0/22"]

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

  enable_nat_gateway     = true
  enable_vpn_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  single_nat_gateway   = true

  tags = {
    Environment = "dev"
  }
}



