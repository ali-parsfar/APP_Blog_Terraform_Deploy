variable "count" {
  default = 1
}

variable "region" {
  description = "AWS region for hosting our your network"
  default     = "ap-southeast-2"
}

variable "public_key_path" {
  description = "Enter the path to the SSH Public Key to add to AWS."
  default     = "~/terraform/secret/keypair_name.pem"
}

variable "key_name" {
  description = "Key name for SSHing into EC2"
  default     = "MyEC2KeyPair"
}

####
#amidata "aws_ami" "lnx-web" {
#  most_recent = true
#
#  filter {
#    name   = "name"
#    values = ["833193269516/fxa-lnx-web02-DevOpsChallenge2"]
#  }
#
#  owners = ["833193269516"] # owned by our account "IM Playground"
#}
#
####

#variable "amis" {
#  description = "Base AMI to launch the instances"
#
#  default = {
#
#    ap-southeast-2 = "${amidata.aws_ami.lnx-web.id}"
#  }
#}
