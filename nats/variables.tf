variable "application_name" {
  description = "Name of your application"
  type        = string
}

variable "application_description" {
  description = "Sample application based on Elastic Beanstalk & Docker"
  type        = string
}

variable "application_environment" {
  description = "Deployment stage e.g. 'staging', 'production', 'test', 'integration'"
  type        = string
}

variable "application_version" {
  description = "Version number for the application"
  type        = string
}

variable "docker_tag" {
  description = "Tag for the docker image to be deployed"
  type        = string
}

variable "docker_image" {
  description = "Image name for the docker image to be deployed"
  type        = string
}

variable "instance_type" {
  description = "Type of the instance to deploy, e.g. t2.micro"
  default     = "t2.micro"
  type        = string
}

variable "autoscaling_maxsize" {
  description = "Maximum size for the autoscaling group"
  default     = "3"
}

variable "health_check" {
  description = "Container endpoint to use for health checks"
}

variable "elb_scheme" {
  description = "Scheme for the ELB, internal, external"
  default     = "external"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to use when creating an internal elb"
  type        = string
}

variable "subnets" {
  description = "subnets for the VPC to use when creating an internal elb"
  type        = list
}

variable "deployment_bucket" {
  description = "S3 bucket for deploying EB package"
  type        = string
}

variable "deployment_bucket_id" {
  description = "S3 bucket ID for deploying EB package"
  type        = string
}
