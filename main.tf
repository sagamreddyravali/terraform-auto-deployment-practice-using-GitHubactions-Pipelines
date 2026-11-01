resource "aws_vpc" "ravali_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "ravali_subnet" {
  vpc_id     = aws_vpc.ravali_vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = var.subnet_name
  }
}