variable vpc_cidr {
    description = "This is a tf variable for vpc cidr block"
    default = "10.0.0.0/16"
    type = string
}

variable subnet_cidr {
    description = "This is a tf variable for subnet cidr block"
    default = "10.0.1.0/24"
    type = string
}

variable route_cidr {
    description = "This is a tf variable for route cidr block"
    default = "0.0.0.0/0"
    type = string
}

variable instance_type {
    description = "This is a tf variable for ec2 instance type"
    default = "t3.micro"
    type = string
}

variable region {
    description = "This is a tf variable for aws region"
    default = "ap-south-1"
    type = string
}

variable project_name {
    description = "This is a tf variable for project_name"
    type = string
}

variable environment {
    description = "This is a tf variable for environment"
    default = "dev"
    type = string
}

variable allowed_ports {
    description = "This is a tf variable for ports allowed"
    default = [22, 80, 443]
    type = list(number)
}

variable extra_tags {
    description = "This is a tf variable for extra tags"
    default = {}
    type = map(string)
}