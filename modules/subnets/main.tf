resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_app" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_app_subnet_cidr
  availability_zone = var.az
}

resource "aws_subnet" "data" {
  vpc_id            = var.vpc_id
  cidr_block        = var.data_subnet_cidr
  availability_zone = var.az
}