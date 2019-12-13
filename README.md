# AWS Terraform Infrastructure

To create:
+ VPC with private and public subnet in one availability zone
+ one bastion in public subnet
+ one app instance in private subnet
+ security groups

...modify ./variables.tf file setting up all necessary information.

Also, modify the name of the S3 bucket in every main.tf file under MODULES directory in **backend** section.

Initialize Terraform with ``` terraform init -reconfigure -backend-config=main.tfbackend ```
command.

Then execute ```terraform plan``` and ```terraform apply```
