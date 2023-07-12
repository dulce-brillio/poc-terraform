provider "aws"{
  region = "us-east-2"
  secret_key = ""
  access_key = ""
}

terraform{
  backend "s3" {
    encrypt = false
    bucket = "tf-state1111"
    dynamodb_table = "tf-state-lock-dynamo"
    key = "state_files/terraform_tfstate"
    region = "us-east-2"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket123456"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
