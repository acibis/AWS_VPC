
variable "ssh_key" {
  description = "ssh key to connect"
  type        = string
  default     = ""  
}

variable instance_count {
  description = "The number of instances to start."
  default     = ""
  type        = string    
}

variable "instance_type" {
  description = "The type of instance to start."
  default     = ""
  type        = string
}

variable "subnet_id" {
  description = "The type of instance to start."
  default     = ""
  type        = string
}

variable "ami_id"  {
  description = "The ami of instance to start."
  default     = ""
  type        = string
}

variable "security_group"  {
  description = "The sg of instance to start."
  default     = []
  type        = list(string)
}

#tags
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    terraformed = true
  }
}
