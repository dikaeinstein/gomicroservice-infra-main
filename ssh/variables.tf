variable "public_key" {
  description = "ssh public key file"
  type        = string
}

variable "namespace" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnets" {
  description = "subnets for the VPC to use when creating the ssh host"
  type        = list
}
