# Bastion hosts outputs

#bastion_public_instance_id
output "bastion_public_instance_id" {
  value = module.ec2_bastion.id
}

# bastion_public_instance_ip
output "bastion_public_instance_ip" {
  value = module.ec2_bastion.public_ip
}


#private_instance_ids
output "private_instance_ids" {
  value = [for each in module.ec2_private : each.id]
}

# private_instance_ips
output "private_instance_ips" {
  value = [for each in module.ec2_private : each.public_ip]
}