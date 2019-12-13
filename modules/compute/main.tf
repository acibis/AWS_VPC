terraform {
  backend "s3" {
    key    = "compute/terraform.tfstate"
    bucket = "tfstatechg"
    region  = "eu-west-1"
  }
}

resource "aws_instance" "app_instance" {

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.ssh_key
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group
  associate_public_ip_address = false

  tags = merge(
    {
      "Name" = "app_instance_"
    },
    var.tags,
  )
}
