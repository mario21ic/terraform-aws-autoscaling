data "template_file" "tag_codedeploy" {
  template = "${var.env}-${var.name}-CodeDeploy"
}

resource "aws_autoscaling_group" "my_asg" {
  name                 = "${var.env}-asg-${var.name}"

  launch_configuration = "${var.launch_configuration_name}"
  //launch_template = {
  //  id = "${var.launch_template_id}"
  //  version = "$$Latest"
  //}

  # Private subnets
  vpc_zone_identifier = ["${var.subnet_ids}"]
  load_balancers      = ["${var.elb_names}"]
  target_group_arns   = ["${var.target_group_arns}"]
  health_check_type   = "${var.health_check_type}"

  max_size         = "${var.max_size}"
  min_size         = "${var.min_size}"
  desired_capacity = "${var.desired_capacity}"

  force_delete = true

  lifecycle {
    create_before_destroy = true
  }

  enabled_metrics = [
    "GroupInServiceInstances",
    "GroupMinSize",
    "GroupDesiredCapacity",
    "GroupPendingInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
    "GroupMaxSize",
    "GroupStandbyInstances",
  ]

  tag {
    key                 = "Name"
    value               = "${var.env}-${var.name}-aut"
    propagate_at_launch = true
  }

  tag {
    key                 = "CodeDeploy"
    value               = "${data.template_file.tag_codedeploy.rendered}"
    propagate_at_launch = true
  }
}
