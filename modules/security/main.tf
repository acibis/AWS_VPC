#security groups for private network
resource "aws_security_group" "private" {
  name        = "allow_traffic"
  description = "Allow  traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_bastion" {
  type            = "ingress"
  from_port       = 0
  to_port         = 0
  protocol        = -1
  cidr_blocks = var.bastion_ip
  security_group_id = aws_security_group.private.id
}

resource "aws_security_group_rule" "allow_alb" {
  type            = "ingress"
  from_port       = 0
  to_port         = 0
  protocol        = -1
  cidr_blocks = var.alb_ip
  security_group_id = aws_security_group.private.id
}

resource "aws_security_group_rule" "allow_out" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = -1
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private.id
}


resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "Allow  traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow only ssh"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}