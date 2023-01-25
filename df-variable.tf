#variable.tf
variable "region" {
    description = "aws-region"
    type        = string
    default     = "us-west-2" 
}

variable "security_group_name" {
    description = "name of security group" #can be modified whenever
    type        = string
    default     = null
}

variable "vpc_id" {
    description = "vpc id for where the sg will be hosted" #this can be modified multiple times
    type        = list(string)
    default     = [] #you can specify a default vpc id here in the bracket
}

variable "aws_instance_ami" {
    description = "ami id for instance" #this varies per region so you can easily modify
    type        = list(string)
    default     = []
}

variable "instance_type" {
    description = "instance type or family type"
    type        = list(string)
    default     = []
}

variable "vpc_security_group_ids" {
    description = "vpc id or ids"
    type        = list(string)
    default     = []
}