# VPC
module "vpc" {
  source   = "./modules/vpc"
   vpc_cidr = var.vpc_cidr
}

# Subnets
module "subnets" {
  source = "./modules/subnets"

  vpc_id                     = module.vpc.vpc_id
  public_subnet_cidr         = var.public_subnet_cidr
  private_app_subnet_cidr    = var.private_app_subnet_cidr
  data_subnet_cidr           = var.data_subnet_cidr
  az                         = var.az
}

# IGW
module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

# NAT
module "nat" {
  source        = "./modules/nat"
  public_subnet = module.subnets.public_subnet_id
  igw_id        = module.igw.igw_id
}

# Route Tables
module "route_tables" {
  source = "./modules/route-tables"

  vpc_id              = module.vpc.vpc_id
  igw_id              = module.igw.igw_id
  nat_id              = module.nat.nat_id

  public_subnet_id    = module.subnets.public_subnet_id
  private_app_subnet  = module.subnets.private_app_subnet_id
  data_subnet         = module.subnets.data_subnet_id
}