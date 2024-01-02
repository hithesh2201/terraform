# resource "aws_instance" "terraform-server-1" {
#   ami           = "ami-00b8917ae86a424c9"
#   instance_type = "t2.micro"
#   vpc_security_group_ids = ["sg-0f0225d73ad9227cc"]
#    key_name      = "demokey"
#    tags = {
#     Name = "MyTerraformServer"

#   }
# }






# resource "aws_instance" "terraform-server-2" {
#   ami           = "ami-00b8917ae86a424c9"
#   instance_type = "t2.micro"
# }
# resource "aws_instance" "terraform-server-3" {
#   ami           = "ami-00b8917ae86a424c9"
#   instance_type = "t2.micro"
# }