variable "vpc_id" {
    type            = string
    default         = ""
}

variable "alb_ip" {
    description     = "Allowed inbound IPs"
    type            = list(string)
    default         = []
}

variable "bastion_ip" {
    description     = "Allowed inbound IPs"
    type            = list(string)
    default         = []
}

variable "security_group"  {
  description = "The ami of instance to start."
  default     = ""
  type        = string
}

#tags
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    terraformed = true
  }
}
