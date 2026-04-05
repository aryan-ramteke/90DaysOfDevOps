resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "DEFAULT_VPC"
  }
}

resource aws_instance my_instance{
    # vpc_id = aws_default_vpc.default_vpc.id
    instance_type = "t3.micro" 
    ami = "ami-05d2d839d4f73aafb" #Ubuntu Server 24.04 LTS (HVM) 
    tags = {
    Name: "My_Instance"
    os_family = "ubuntu"
    }
}

resource aws_s3_bucket logs_bucket {
    bucket = "terraweek-import-test-aaryan"
}