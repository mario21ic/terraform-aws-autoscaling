variable "region" {
  description = "aws region"
}

variable "env" {
  description = "Environment name"
}

variable "name" {
  description = "Name"
}

//variable "tag_start_stop_key" {
//  description = "Key of tag start stop"
//}
//
//variable "tag_start_stop_value" {
//  description = "Value of tag start stop"
//}

variable "launch_configuration_name" {}
//variable "launch_template_id" {}

//variable "sns_topic_arn" {
//  default = ""
//  description = ""
//}

variable "desired_capacity" {
  description = "Desired capacity"
}

variable "max_size" {
  description = "Max size"
}

variable "min_size" {
  description = "Min size"
}

variable "health_check_type" {
  default     = "EC2"
  description = "Values EC2 or ELB"
}

/* Externals */
variable "vpc_id" {
  description = "vpc id"
}

variable "elb_names" {
  type        = "list"
  default     = []
  description = "Load balancer names"
}

variable "target_group_arns" {
  type        = "list"
  default     = []
  description = "Target group arns"
}

variable "subnet_ids" {
  type        = "list"
  default     = []
  description = "Subnet available"
}
