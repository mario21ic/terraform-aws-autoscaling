output "id" {
  value = "${aws_autoscaling_group.my_asg.id}"
}

output "name" {
  value = "${aws_autoscaling_group.my_asg.name}"
}

output "arn" {
  value = "${aws_autoscaling_group.my_asg.arn}"
}

output "tag_codedeploy" {
  value = "${data.template_file.tag_codedeploy.rendered}"
}
