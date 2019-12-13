#check version
terraform {
    required_version = ">= 0.12, < 0.13, < 1.0"
}

# Configure the AWS Provider
provider "aws" {
    region  = var.region
}

#create key_pair
resource "aws_key_pair" "aws-keypair" {
  key_name = var.key_name
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

#configure network
module "network-infra" {
  source            = "./modules/network-infra"

  name              = var.network["name"]
  cidr              = var.network["cidr"]
  azs               = var.network["azs"]
  public_subnets    = var.network["public_subnets"]
  private_subnets   = var.network["private_subnets"]
}

#configure bastion
module "bastion" {
  source            = "./modules/bastion"

  security_group    = [module.security.bastion_sg]
  ami_id            = var.bastion["ami_id"]
  ssh_key           = aws_key_pair.aws-keypair.id
  instance_type     = var.bastion["instance_type"]
  subnet_id        = module.network-infra.public_subnet_id
}

#configure app instance
module "compute" {
  source            = "./modules/compute"

  security_group    = [module.security.private_sg]
  ami_id            = var.compute["ami_id"]
  ssh_key           = aws_key_pair.aws-keypair.id
  instance_type     = var.compute["instance_type"]
  subnet_id         = module.network-infra.private_subnet_id
}

#configure security
module "security" {
  source            = "./modules/security"

  vpc_id            = module.network-infra.vpc_id
  bastion_ip        = [format("%s/32",module.bastion.instance_ip)]
}
