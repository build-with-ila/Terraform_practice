terraform{
    backend "s3"{
        bucket = "iladb-table"
        key = "ila/terraform.tfstate"
        region = "ap-south-1"
        encrypt = true
        dynamodb_table = "terraform-lock"
    }
}