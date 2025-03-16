# Map of instance names to public IP addresses
variable "private_ips" {
  type = map(string)
  default = {
    "instance-1" = "172.31.22.126",
    "instance-2" = "172.31.22.127",
    "instance-3" = "172.31.22.128",
  }
}

# EC2 module to create instances
module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each      = var.private_ips
  name          = each.key
  ami           = "ami-04b4f1a9cf54c11d0"  # Replace with your AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0a17982abe1fa53e6"  # Replace with your subnet ID

  # Assign the public IP address
  associate_public_ip_address = true
  private_ip                  = each.value
}
