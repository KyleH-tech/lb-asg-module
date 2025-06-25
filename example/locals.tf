locals {
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c" ]
}
locals {
  lb_subnets = module.network.public_subnet_ids
}
