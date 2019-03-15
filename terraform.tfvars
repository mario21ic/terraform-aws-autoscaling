region = "us-west-2"
env = "draft"
name = "demo"

//sns_topic_arn = "sdsajkdsaldsa"
max_size = 2
min_size = 1
desired_capacity = 1

elb_names                 = []
launch_template_id = "lt-0eefbb198e3f21162"
//launch_configuration_name = "qa-api-71"
target_group_arns = ["arn:aws:elasticloadbalancing:us-west-2:794250218868:targetgroup/qa-tg-api-0/3e166e6f0892c15a"]
//schedule_start_time       = "2017-10-12T19:00:00Z"
//schedule_start_recurrence = "50 3 * * 1,2,3,4,5"
//schedule_end_time         = "2017-10-13T19:00:00Z"
//schedule_end_recurrence   = "0 0 * * 1,2,3,4,5"

vpc_id = "vpc-cd09f5b5"
subnet_ids = ["subnet-0842047c9d00b1095", "subnet-017d4d923f47f2be3"]
