provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my_ec2_instance_day3" {
    ami = var.ami_value
    instance_type = var.instance_type_value
        tags = {
        Name = var.ec2_name_value
    }
}
