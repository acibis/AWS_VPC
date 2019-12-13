#security groups for private network
resource "aws_security_group" "private" {
  name        = "private_sg"
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

# resource "aws_security_group_rule" "allow_alb" {
#   type            = "ingress"
#   from_port       = 0
#   to_port         = 0
#   protocol        = -1
#   cidr_blocks = var.aws_lb.id
#   security_group_id = aws_security_group.private.id
# }

resource "aws_security_group_rule" "allow_out" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = -1
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private.id
}


resource "aws_security_group" "public" {
  name        = "public_sg"
  description = "Allow  traffic"
  vpc_id      = var.vpc_id

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

# resource "aws_security_group_rule" "allow_alb_to_bastion" {
#   type            = "ingress"
#   from_port       = 0
#   to_port         = 0
#   protocol        = -1
#   cidr_blocks =   var.aws_alb.id
#   security_group_id = aws_security_group.public.id
# }