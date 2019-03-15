terraform {
  required_version = ">= 0.10.0"
}

provider "aws" {
  region  = "${var.region}"
  version = ">= 1.0.0"
}

provider "template" {}

module "asg" {
  source = "../../"

  region = "us-west-2"
  env    = "draft"
  name   = "demo"

  max_size         = 4
  min_size         = 1
  desired_capacity = 1

  //  elb_names                 = ["bmqa-elb", "bmqa-elb-ssl"]
  launch_configuration_name = "qa-lc-303"

  vpc_id     = "vpc-cd09f5b5"
  subnet_ids = ["subnet-0842047c9d00b1095", "subnet-017d4d923f47f2be3"]
}
