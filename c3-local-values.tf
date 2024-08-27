locals {
  environment = var.environment
  region      = var.aws_region
  created_by  = "AJ (${var.created_by})"
  common_tags = {
    environment = local.environment
    created_by  = local.created_by
  }
}