provider "aws" {
  region = "ap-south-1"
}
#check for docs of terraform 
#providername_service and then name of this resource which has scope till terraform
resource "aws_instance" "MyEC2Instance" {
  ami = "ami-0cfedf42e63bba657"
  instance_type = "t2.micro"
  tags = {
    "Name" = "MyUbuntu"
  }
}
resource "aws_subnet" "mysubnet-1" {
    vpc_id = "${aws_vpc.MyVPC.id}"
    cidr_block = "10.0.1.0/24"
  
}
resource "aws_vpc" "MyVPC" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "MyVpc"
    }
}

#Commands to run 
# terraform init {}
# terraform plan {it dry run our plan}
# terraform apply
# terraform destroy