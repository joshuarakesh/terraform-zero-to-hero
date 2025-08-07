output "public-ip-address" {
  value = aws_instance.my_ec2_instance_day3.public_ip
}

output "instance_name" {
  value = aws_instance.my_ec2_instance_day3.tags["Name"]
}
