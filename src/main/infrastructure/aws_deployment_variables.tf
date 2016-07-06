variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "application" {}
variable "application_name" {
  default = "njugdemoapplication"
}
variable "key_name" {
  default = "njugdemo"
}
variable "aws_access_key_file_name" {
  default = "njugdemo.pem"
}