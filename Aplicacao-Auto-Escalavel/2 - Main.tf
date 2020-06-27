provider "aws" {
  region = "${var.region}"
}

locals {
  tags = {
    Name = "Project Scale"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"

  tags = "${local.tags}"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = "${local.tags}"
}

resource "aws_subnet" "public_a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.public_a_cidr}"
  availability_zone = "${var.region}a"

  tags = {
    Name = "Subnet Public 1a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.public_b_cidr}"
  availability_zone = "${var.region}b"

  tags = {
    Name = "Subnet Public 1b"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.private_a_cidr}"
  availability_zone = "${var.region}a"

  tags = {
    Name = "Subnet Private 1a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.private_b_cidr}"
  availability_zone = "${var.region}b"

  tags = {
    Name = "Subnet Private 1b"
  }
}
