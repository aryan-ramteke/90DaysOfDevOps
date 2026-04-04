data aws_ami instance_ami {
    owners = ["amazon"]
    most_recent = true
    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
   filter {
    name   = "name"
    values = ["amzn2-ami*"]
  }
}

data aws_availability_zones AZ {
    state = "available"
}