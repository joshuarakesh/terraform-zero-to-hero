provider "aws" {
  region = "us-east-2"
}

provider "vault" {

    address = "http://13.59.12.248:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "b9bdb15b-3b19-5fba-2d2d-07f1d771fee5"  #copied from the aws terminal window
      secret_id = "fc915bda-32b2-d230-1458-bfe5fe2dd80f"  #copied from the aws terminal window
    }
  }
}
#to retrieve from data we will use key word called data
data "vault_kv_secret_v2" "example" {
  mount = "kv"             # this one we have created manually from vault login page
  name  = "test-secret"    # this one we have created manually from vault login page
}

resource "aws_instance" "vault-demo" {
  ami = "ami-0d1b5a8c13042c939"
  instance_type = "t2.micro"

  tags = {
    secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
