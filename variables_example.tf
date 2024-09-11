```hcl
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

variable "instance_type"{
    description = "EC2 Instance Type"
    type = string
    default = "t2.micro"
}
variable "ami_id"{
    description = "EC2 AMI ID"
    type = string
}
output "public_ip"{
    description = "Public IP address of the EC2 Instance"
    value = aws_instance.example_instance.public_ip
}

provider "aws"{
    region="ap-south-1"
}
resource "aws-instance" "example_instance"{
    #ami="ami-0522ab6e1ddcc7055"
    ami = var.ami_id
    instance_type = var.instance_type
}
```