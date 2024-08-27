module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "public-bastion-sg"
  description = "This is for the bastion instance in public subnet. Ingress SSH port will be open for all. Egress all open."
  vpc_id      = module.vpc.vpc_id

  #Ingress rules
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]


  #Egress rules
  egress_rules = ["all-all"]


  tags = local.common_tags

}

