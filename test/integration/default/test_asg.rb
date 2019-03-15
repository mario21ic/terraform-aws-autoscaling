# frozen_string_literal: true

require 'awspec'
require 'aws-sdk'
require 'rhcl'

# should strive to randomize the region for more robust testing
example_main = Rhcl.parse(File.open('examples/test_fixtures/main.tf'))
# puts "example_main #{example_main}"

asg_env = example_main['module']['asg']['env']
asg_name = asg_env + "-asg-" + example_main['module']['asg']['name']

state_file = 'examples/test_fixtures/terraform.tfstate.d/kitchen-terraform-default-aws/terraform.tfstate'
tf_state = JSON.parse(File.open(state_file).read)
# puts "tf_state#{tf_state}"

region = tf_state['modules'][0]['outputs']['region']['value']
ENV['AWS_REGION'] = region

ec2 = Aws::EC2::Client.new(region: region)

# azs = ec2.describe_availability_zones
# zone_names = azs.to_h[:availability_zones].first(2).map { |az| az[:zone_name] }

describe autoscaling_group(asg_name) do
  it { should exist }

  it { should have_launch_configuration('qa-lc-303') }
  it { should have_tag('CodeDeploy').value('draft-demo-CodeDeploy') }

  # it { should have_ec2('draft-demo-aut') }
  # it { should have_alb_target_group('my-alb-target-group') }
  # it { should have_elb('my-elb') }
end