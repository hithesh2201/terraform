output "ami_centos" {
    value = data.aws_ami.centos8.id
  
}

output "sg_id" {
    value = data.aws_security_group.ec2_sg.id
  
}