
variable "aws_region" {
  description = "Region where the instance should be located"
  default = "eu-central-1"
}
variable "instance_type" {
  description = "Instance type to launch"
  default = "t2.micro"
}
variable "ssh_key_name" {
  description = "Name of the SSH key"
  default = "terraform-key"
}
variable "eip" {
  description = "Elastic IP associated with the instance"
}
variable "email_address" {
  description = "Email to use for the certificate generation"
  default     = "user@domain.de"
}
variable "domain_name" {
  description = "Domain of the Jitsi Server"
  default     = "jitsi.example.com"
}
variable "tfstate_s3_bucket" {
    description = "Bucket for tfstate in S3 (has to be prerared manually before running scripts)"
    default = "tfstate.jitsi.example.com"
}

variable "tfstate_s3_key" {
    description = "Bucket for tfstate in S3 (has to be prerared manually before running scripts)"
    default = "jitsi/tfstate"
}