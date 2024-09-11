terraform{
   required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
        azurem = {
            source = "hashicorp/azurem"
            version = ">= 2.0, <3.0"
        }
   } 
}

provider "aws"{
    region="ap-south-1"
}
module "aws-instance"{
    source = "./modules/ec2_instance"
    ami_value = "ami-0522ab6e1ddcc7055"
    instance_type_value = "t2.micro"
    subnet_id_value = "subnet-019ea91ed9b5252e7"
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "iladb-table" # change this
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}