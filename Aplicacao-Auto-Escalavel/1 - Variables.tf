variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "public_a_cidr" {
  default = "192.168.1.0/24"
}

variable "public_b_cidr" {
  default = "192.168.2.0/24"
}

variable "private_a_cidr" {
  default = "192.168.6.0/23"
}

variable "private_b_cidr" {
  default = "192.168.4.0/23"
}

variable "ami" {
  default = "ami-01d025118d8e760db"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair" {
  default = "terraform-aws" # Altere o valor dessa variavel para a sua chave
}
