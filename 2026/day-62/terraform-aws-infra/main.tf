resource "aws_vpc" "terra-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "TerraWeek-VPC"
  }
}

resource "aws_subnet" "terra-subnet" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.terra-vpc.id
  map_public_ip_on_launch = true
  tags = {
  Name = "TerraWeek-Public-Subnet" }
}

resource "aws_internet_gateway" "terra-gateway" {
  vpc_id = aws_vpc.terra-vpc.id
  tags = {
    Name = "TerraWeek-Internet-Gateway"
  }
}

resource "aws_route_table" "terra-route-table" {
  vpc_id = aws_vpc.terra-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra-gateway.id
  }

  tags = {
    Name = "TerraWeek-Route-Table"
  }
}

resource "aws_route_table_association" "terra-route-tbl-association" {
  subnet_id      = aws_subnet.terra-subnet.id
  route_table_id = aws_route_table.terra-route-table.id

}

resource "aws_security_group" "terra-sg" {
  vpc_id = aws_vpc.terra-vpc.id
  tags = {
    Name = "TerraWeek-SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "terra-ingress-ssh-rule" {
  security_group_id = aws_security_group.terra-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "terra-ingress-http-rule" {
  security_group_id = aws_security_group.terra-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "terra-egress-rule" {
  security_group_id = aws_security_group.terra-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_instance" "terra-instance" {
  ami                         = "ami-0a343c133937afdb9"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra-subnet.id
  vpc_security_group_ids      = [aws_security_group.terra-sg.id]
  tags = {
    Name = "TerraWeek-Server"
  }
lifecycle {
  create_before_destroy = true
}
}

resource aws_s3_bucket terra-bkt {
bucket  = "TerraWeek-bkt"
depends_on = [aws_instance.terra-instance]
}
