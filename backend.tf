
terraform {
  backend "s3" {
    bucket = "tfstate-jitsi"
    key    = "jitsi"
    region = "eu-central-1"
  }
}
