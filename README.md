# JITSI-AWS

Work derived from https://github.com/AvasDream/terraform_aws_jitsi_meet

## What is does

Terraform script to create a Create a [JITSI-Server](https://jitsi.org/) in the AWS cloud. Everything is automatted.

The server does not record anything.

## How to use

These steps are one time only:

- Get the requirements (see below)
- Clone the repo
- Configure your settings (see below)
- Call `terraform init` in a shell script inside the repo-folder

Any time you need the server do:

- `terraform apply` to create the server  (answer `yes` if asked to perform these actions)
- Give your dns name and a room name to your friends you want to video-chat with. Rooms are auto-created on entering
- `terraform destroy` to completely remove the server / all rooms.

## Requirements

- Terraform is installed and in the current $PATH
- You know your AWS access and secret keys. [Official Documentation](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html)
- You created an AWS SSH Key. [Official Documentation](https://docs.aws.amazon.com/ground-station/latest/ug/create-ec2-ssh-key-pair.html)
- You allocated a Elastic IP in AWS.
- You own a domain Name and created a a record entry for the Elastic IP.
- You created an S3 bucket with a unique name. Choose standard encryption.

## Setup

1. create a file `credentials` in `~/.aws` (Unix) or `%HOMEPATH%\.aws` (Windows), see below
2. Create a `terraform.tfvars` file (see below).
3. Copy example Content of the template given below to `terraform.tfvars`.
4. Enter/adjust your own data.
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
ssh_key_name = "your-aws-ssh-key"
eip     = "1.3.3.7"
email_address     = "user@domain.de"
domain_name     = "jitsi.example.com"
tfstate_s3_bucket = "tfstate.example.com"
tfstate_s3_key = "jitsi/tfstate"
```

## References

[Terraform set eip](https://www.terraform.io/docs/providers/aws/r/eip_association.html)

## Troubleshooting

The Jitsi instance is per default not accessible via ssh for security reasons. If you have to debug it perform the following steps:

- Get your public IP address, e.g. by visiting [this site](https://get-myip.com/)
- Open the [AWS Management Console](https://aws.amazon.com) and open the `EC2-Dashboard`
- Choose `security groups` from the list on the left side and select `allow_connections_jitsi-meet`
- Choose `Rules for incoming traffic`, click `edit rules for incoming traffic`
- Add a rule for SSH and enter `<your-ip-address>/0` as source

Then you can connect to the instance. Remember to include `your-aws-ssh-key.pem` into the ssh-command, e.g.

```bash
ssh -i ~/.ssh/your-aws-ssh-key.pem ubuntu@<your-dns-name>
```

