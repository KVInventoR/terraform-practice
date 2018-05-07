module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  name = "autoscaling"

  # Launch configuration
  lc_name = "launchconfig-auto"

  image_id        = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.micro"
  security_groups = ["${module.vote_service_sg.this_security_group_id}"]

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "8"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = "8"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = "autoscaling-asg"
  vpc_zone_identifier       = "${module.vpc.public_subnets}"
  health_check_type         = "EC2"
  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "megasecret"
      propagate_at_launch = true
    },
  ]

  tags_as_map = {
    extra_tag1 = "extra_value1"
    extra_tag2 = "extra_value2"
  }
}
