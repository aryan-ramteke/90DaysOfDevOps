locals {
  name_prefix = "${var.project_name}-${var.environment}"
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_vpc" "terra-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-VPC"
})
}

resource "aws_subnet" "terra-subnet" {
  cidr_block              = var.subnet_cidr
  vpc_id                  = aws_vpc.terra-vpc.id
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.AZ.names[0]
  tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-Public-Subnet"
})
}

resource "aws_internet_gateway" "terra-gateway" {
  vpc_id = aws_vpc.terra-vpc.id
  tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-Internet-Gateway"
})
}

resource "aws_route_table" "terra-route-table" {
  vpc_id = aws_vpc.terra-vpc.id
  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.terra-gateway.id
  }
tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-Route-Table"
})
}

resource "aws_route_table_association" "terra-route-tbl-association" {
  subnet_id      = aws_subnet.terra-subnet.id
  route_table_id = aws_route_table.terra-route-table.id

}

resource "aws_security_group" "terra-sg" {
  vpc_id = aws_vpc.terra-vpc.id
  tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-SG"
})
}

resource "aws_vpc_security_group_ingress_rule" "terra-ingress-ssh-rule" {
  security_group_id = aws_security_group.terra-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.allowed_ports[0]
  ip_protocol       = "tcp"
  to_port           = var.allowed_ports[0]
}

resource "aws_vpc_security_group_ingress_rule" "terra-ingress-http-rule" {
  security_group_id = aws_security_group.terra-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.allowed_ports[1]
  ip_protocol       = "tcp"
  to_port           = var.allowed_ports[1]
}

resource "aws_vpc_security_group_egress_rule" "terra-egress-rule" {
  security_group_id = aws_security_group.terra-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_instance" "terra-instance" {
  ami                         = data.aws_ami.instance_ami.id
  instance_type               = var.environment == "prod" ? "t3.small" : "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra-subnet.id
  vpc_security_group_ids      = [aws_security_group.terra-sg.id]
  tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-server"
})
lifecycle {
  create_before_destroy = true
}
}

resource aws_s3_bucket terra-bkt {
bucket  = "${var.environment}-terraweek-bkt"
depends_on = [aws_instance.terra-instance]
}
