provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "example1" {
  identifier           = "example1-db"
  engine               = "mysql"
  engine_version       = "8.4.3"
  instance_class       = "db.t3.micro"
  allocated_storage    = 10  # Required field
  username             = "admin"
  password             = "supersecretpassword"
  db_subnet_group_name = "db"
  skip_final_snapshot  = true  # Skip final snapshot when destroying the instance
}

output "db_endpoint" {
  value = aws_db_instance.example1.endpoint
}

output "db_password " {
  value = aws_db_instance.example1.password
  sensitive = true # marks outputs as sensitive
}
