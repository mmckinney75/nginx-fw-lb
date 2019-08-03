variable "aws_access_key" {
  type = "string"
}
variable "aws_secret_key" {
  type = "string"
}
variable "region" {
  type = "string"
}
variable "proj_prefix" {
  default = "nginx-fw-lb"
}
variable "az_count" {
  default = "1"
}
variable "vpc_cidr_base" {
  default = ""
}
