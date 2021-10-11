variable "region" {
  description = "Please Enter AWS Region to deploy Server"
  type        = string
  default     = "eu-central-1"
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map
  default = {
    Owner       = "Alexandre Arbuzov"
  }
}

variable "my_cidr" {
  description = "My IP Address block"
  type        = string
  default     = "0.0.0.0/0"
}
