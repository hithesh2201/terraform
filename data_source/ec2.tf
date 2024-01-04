resource "aws_instance" "web" {
  ami           = data.aws_ami.centos8.id
  instance_type = "t2.micro"
  vpc_security_group_ids= [data.aws_security_group.ec2_sg.id]
  tags = {
        Name = "dynamic"
  }
}  # i hadnt practiced still need to practice
