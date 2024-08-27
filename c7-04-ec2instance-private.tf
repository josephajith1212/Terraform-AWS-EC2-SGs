module "ec2_private" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "5.6.1"

  for_each = { #this is to create 2 instances
    "one" = module.vpc.private_subnets[0],
    "two" = module.vpc.private_subnets[1],
  }
  name                   = "${var.environment}-ec2_private-${each.key}"
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = false
  subnet_id              = each.value
  vpc_security_group_ids = [module.private_sg.security_group_id]
  user_data              = file("${path.module}/app-install.sh")
  tags                   = local.common_tags
}