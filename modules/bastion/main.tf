terraform {
  backend "s3" {
    key    = "bastion/terraform.tfstate"
    bucket = "tfstatechg"
    region  = "eu-west-1"
  }
}

resource "aws_instance" "bastion" { 
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.ssh_key
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group

  tags = merge(
    {
      "Name" = "bastion"
    },
    var.tags,
  )
}

resource "aws_eip" "bastion_eip" {
  instance = "${aws_instance.bastion.id}"
}