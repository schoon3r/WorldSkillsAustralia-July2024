# VPC
resource "aws_vpc" "WORLDSKILLSAUS-vpc" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "WORLDSKILLSAUS2024"
  }
  tags_all = {
    Name = "WORLDSKILLSAUS2024"
  }
}

# Gateway
resource "aws_internet_gateway" "WORLDSKILLSAUS-ig" {
  vpc_id = aws_vpc.WORLDSKILLSAUS-vpc.id
  tags = {
    Name = "WORLDSKILLSAUS2024"
  }
  tags_all = {
    Name = "WORLDSKILLSAUS2024"
  }
}

# Routing Table
resource "aws_route_table" "WORLDSKILLSAUS-rt" {
  vpc_id = aws_vpc.WORLDSKILLSAUS-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.WORLDSKILLSAUS-ig.id
  }
  tags = {
    Name = "WORLDSKILLSAUS2024"
  }
  tags_all = {
    Name = "WORLDSKILLSAUS2024"
  }
}

# RT Association
resource "aws_route_table_association" "WORLDSKILLSAUS-rta" {
  subnet_id      = aws_subnet.WORLDSKILLSAUS-subnet.id
  route_table_id = aws_route_table.WORLDSKILLSAUS-rt.id

}

# Subnets
resource "aws_subnet" "WORLDSKILLSAUS-subnet" {
  vpc_id     = aws_vpc.WORLDSKILLSAUS-vpc.id
  cidr_block = var.cidr_subnet
  tags = {
    Name = "WORLDSKILLSAUS2024"
  }
  tags_all = {
    Name = "WORLDSKILLSAUS2024"
  }
}
