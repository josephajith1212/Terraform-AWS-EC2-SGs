module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name = "${local.environment}-ec2-bastion"

  instance_type          = var.instance_type
  ami                    = data.aws_ami.amzlinux2
  key_name               = var.key_name
  monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  tags                   = local.common_tags
}