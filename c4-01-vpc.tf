module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"


  name = "aj-vpc1"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  #DB subnets
  database_subnets = ["10.0.111.0/24", "10.0.112.0/24"]
  #This is needed to deploy RDS instances
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  #   create_database_internet_gateway_route = true

  #Enable NAT gateway for the private subnet outbound comm.
  enable_nat_gateway = true
  single_nat_gateway = false #cost

  enable_dns_hostnames = true
  enable_dns_support   = true

  #Tags

  vpc_tags = {
    name = "aj-vpc-dev"
  }

  public_subnet_tags = {
    name = "public-subnet"
  }

  private_subnet_tags = {
    name = "private-subnet"
  }

  database_subnet_tags = {
    name = "database-subnet"
  }

  tags = local.common_tags

}

