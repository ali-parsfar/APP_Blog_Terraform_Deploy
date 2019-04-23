### Creating EC2 instance


data "aws_ami" "fxa_lnx_web" {
  most_recent = true

  filter {
     name = "name"
     values  = ["FXA_APP_Blog_WP_TST"]
}
  owners = ["833193269516"] # FXA Account

}

resource "aws_instance" "web" {
  ami                    = "${data.aws_ami.fxa_lnx_web.id}"
  count                  = "${var.count}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  source_dest_check      = false
  instance_type          = "t2.micro"
  tags = {
    Name = "AWSLNX2_Blog_WP_WEB01"
  }
}

### Creating Security Group for EC2
resource "aws_security_group" "instance" {
  name = "AWSLNX2_Blog_WP_WEB_SG"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
