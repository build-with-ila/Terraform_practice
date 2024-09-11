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
module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_value = var.ami_val
    instance_type_value = var.instance_type_val
    subnet_id_value = var.subnet_id_val
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