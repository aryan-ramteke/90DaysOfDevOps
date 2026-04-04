output vpc_id {
    value = aws_vpc.terra-vpc.id
}

output subnet_id {
    value = aws_subnet.terra-subnet.id
}

output instance_id {
    value = aws_instance.terra-instance.id
}

output instance_public_ip {
    value = aws_instance.terra-instance.public_ip
}

output instance_public_dns {
    value = aws_instance.terra-instance.public_dns
}

output security_group_id {
    value = aws_security_group.terra-sg.id
}
