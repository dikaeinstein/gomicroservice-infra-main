module "vpc" {
  source    = "./vpc"
  namespace = var.namespace
}

module "s3" {
  source           = "./s3"
  application_name = "dikaeinstein-gomicroservice"
}

module "ssh" {
  source     = "./ssh"
  namespace  = var.namespace
  public_key = var.public_key
  vpc_id     = module.vpc.id
  subnets    = module.vpc.subnets
}

module "nats" {
  source = "./nats"

  application_name        = "nats"
  application_description = "Nats.io server"
  application_environment = "dev"

  deployment_bucket    = module.s3.deployment_bucket
  deployment_bucket_id = module.s3.deployment_bucket_id

  application_version = "1.1"
  docker_image        = "nats"
  docker_tag          = "latest"

  elb_scheme   = "internal"
  health_check = "/varz"

  vpc_id  = module.vpc.id
  subnets = module.vpc.subnets
}
