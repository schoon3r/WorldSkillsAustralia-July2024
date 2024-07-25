variable "cidr_vpc" {
  description = "CIDR block for VPC"
  default     = "10.80.0.0/16"
}

variable "cidr_subnet" {
  description = "DEMO subnet"
  default     = "10.80.210.0/24"
}

variable "private_subnet" {
  description = "CIDR blocks"
  type        = list(string)
  default     = [
    "10.80.1.0/24",
    "10.80.2.0/24",
    "10.80.3.0/24"
  ]
}

variable "aws_region" {  
  default     = "us-east-1"
}

variable "s3_bucket_name" {  
  default     = "tf-state-12der3"
}

variable "dynamodb_table_name" {  
  default     = "tf-lock-12der3"
}
