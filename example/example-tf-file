module "compute" {
  aws_region = var.aws_region
  source = ".//modules/lb-asg"
  local_ip = var.local_ip
  availability_zones = local.availability_zones
  public_subnet_ids = module.network.public_subnet_ids
  vpc_id = module.network.vpc_id
}

module "network" {
  aws_region = var.aws_region
  source = ".//modules/vpc"
  local_ip = var.local_ip
  availability_zones = local.availability_zones
}
