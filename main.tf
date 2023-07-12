provider "aws"{
  region = "us-east-2"
  #secret_key = ""
  #access_key = ""
  assume_role {
    role_arn    = "arn:aws:iam::019994827807:role/service-role/codebuild-terraform-build-service-role"
  }
}

terraform{
  backend "s3" {
    encrypt = false
    bucket = "tf-state1111"
    #dynamodb_table = "tf-state-lock-dynamo"
    key = "state_files"
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
