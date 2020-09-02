# Requirements

- Terraform is installed and in the current \$PATH
- You know your AWS access and secret keys. [Official Documentation](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html)
- You created an AWS SSH Key. [Official Documentation](https://docs.aws.amazon.com/ground-station/latest/ug/create-ec2-ssh-key-pair.html)
- You allocated a Elastic IP in AWS.
- You own a domain Name and created a a record entry for the Elastic IP.
- You created an S3 bucket with name `tfstate-jitsi`. Choose standard encryption and place in `eu-central-1` (otherwise change `tfstate.tf`)

## Setup

1. create a file `credentials` in `~/.aws` (Unix) or `%HOMEPATH%\.aws` (Windows), see below
2. Create a `terraform.tfvars` file (see below).
3. Copy example Content in Variables file.
4. Enter your own data.
5. Execute `terraform init` (Use `terraform init -reconfigure` if you changed the backend)
6. Execute `terraform apply`

## Files

### `credentials` file

```properties
[default]
aws_access_key_id = put-your-access-key-id
aws_secret_access_key = put-your-secret-access-key
```

### `terraform.tfvars` file

```properties
aws_region = "eu-central-1"

instance_type = "t2.large"

ssh_key_name = "terraform-key"
ssh_ip_whitelist = ["1.3.3.7/32"]
eip     = "1.3.3.7"
email_address     = "user@domain.de"
domain_name     = "jitsi.example.com"
tfstate_s3_bucket = "tfstate.example.com"

```

## References

[Terraform set eip](https://www.terraform.io/docs/providers/aws/r/eip_association.html)
