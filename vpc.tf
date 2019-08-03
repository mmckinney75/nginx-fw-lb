module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "${var.proj_prefix}"

  cidr = "${var.vpc_cidr_base}"
  azs = "${slice(data.aws_availability_zones.available.names,0,var.az_count)}"
  private_subnets = ["10.1.0.0/24"]
  public_subnets = ["10.1.1.0/24"]

  enable_nat_gateway = true
}
