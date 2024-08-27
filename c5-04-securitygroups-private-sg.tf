module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "private-sg"
  description = "SG with HTTP and SSH open only for the VPC block"

  #Ingress
  ingress_cidr_blocks = module.vpc.vpc_cidr_block
  ingress_rules       = ["http-80-tcp", "ssh-tcp"]

  #Egress

  tags = local.common_tags
}