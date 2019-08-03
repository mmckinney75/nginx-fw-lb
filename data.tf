data "aws_ami" "ubuntu_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
      name   = "architecture"
      values = ["x86_64"]
  }
  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}

data "aws_availability_zones" "available" {}


data "aws_vpcs" "current_vpcs" {
}

data "null_data_source" "vpc_count" {
  inputs = {
    vpc_count = "${length(data.aws_vpcs.current_vpcs.ids)}"
  }
}

//data "aws_vpc" "current_vpc" {
//  id = "${join(",", data.aws_vpcs.current_vpcs.*.ids)}"
//}

data "external" "priv_subnet_list" {
  program = ["/bin/bash", "./scripts/local/gen_subnet_list.sh"]
  query = {
    # map of strings passed to the external program as the data query.
    vpc_cidr_base = "${var.vpc_cidr_base}"
    subnet_type = "private"
    count = "${var.az_count}"
  }
}
