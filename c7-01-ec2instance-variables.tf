variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "terraform_key"
}

variable "private_instance_count" {
  type    = number
  default = 1
}