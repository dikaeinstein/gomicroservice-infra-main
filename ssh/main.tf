# Get the list of official Canonical Ubuntu 18.04 AMIs
data "aws_ami" "ubuntu-1804" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# A security group that makes the instances accessible
resource "aws_security_group" "ssh" {
  name_prefix = var.namespace
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ssh-host" {
  ami           = data.aws_ami.ubuntu-1804.id
  instance_type = "t2.nano"

  subnet_id              = element(var.subnets, 0)
  vpc_security_group_ids = [aws_security_group.ssh.id]
  user_data              = templatefile("${path.module}/templates/startup.sh.tpl", { "public_key" = var.public_key })

  tags = { "Name" = "${var.namespace}-ssh-host" }
}
