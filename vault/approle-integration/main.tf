provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://54.224.253.241:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "d8f0b0c8-d81c-e6c2-bc5e-4d3c7375b648"
      secret_id = "316a8f31-6ae3-a5d1-c50e-5cc4108ef0ce"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["name"]
  }
}
