provider "aws" {
  region = "us-east-2"
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_value = "ami-020cba7c55df1f615"
    instance_type_value = "t2.micro"
    subnet_id_value = "subnet-053c34acfaeb0e55e"
    ec2_name_value = "Terraform-EC2-Day3"
}


output "ec2_public_ip" {
  value = module.ec2-instance.public-ip-address
}

output "ec2_instance_name" {
  value = module.ec2-instance.instance_name
}
