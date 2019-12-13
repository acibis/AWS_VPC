#VPC variables
variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = ""
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = string
  default     = ""
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  type        = bool
  default     = true
}


#subnet variables
variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = string
  default     = ""
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = string
  default     = ""
}

variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public"
}

variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets name"
  type        = string
  default     = "private"
}

#app load balancer
variable "alb_suffix" {
  description = "Suffix to append to private subnets name"
  type        = string
  default     = "alb"
}

#tags
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    terraformed = true
  }
}