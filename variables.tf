# general info
variable "region" {
  description = "your AWS reion"
  type        = string
  default     = "eu-west-1"
}

# key vars
variable "PATH_TO_PUBLIC_KEY"{
  #insert the path to your public key
  type        = string
  default     = ""
}

variable "key_name"{
  type        = string
  default     = "awskey"
}

# backend info
variable "bucket" {
  description = "name of existing s3 bucket"
  type        = string
  default     = "tfstatechg"
}

variable "network_key" {
  type        = string
  default     = "network/terraform.tfstate"
}

variable "bastion_key" {
  type        = string
  default     = "bastion/terraform.tfstate"
}

variable "compute_key" {
  type        = string
  default     = "compute/terraform.tfstate"
}

# network module
variable "network" {
  type = map
  default = {
    name              = "first_vpc"       #vpc name
    cidr              = "10.111.0.0/16"   #cidr for vpc
    azs               = "eu-west-1a"      #availability zone
    public_subnets    = "10.111.1.0/24"   #cidr for public subnet
    private_subnets   = "10.111.2.0/24"   #cidr for private subnet
  }
}


# bastion module
variable "bastion" {
  type = map
  default = {
    ami_id            = "ami-0033f08ef49b71cb4"
    instance_type     = "t2.micro"
  }
}

# compute module
variable "compute" {
  type = map
  default = {
    ami_id            = "ami-0033f08ef49b71cb4"
    instance_type     = "t2.micro"
  }
}