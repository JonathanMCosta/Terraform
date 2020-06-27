resource "aws_security_group" "web" {

  name        = "Web Server"
  description = "Public Traffic"
  vpc_id      = "${aws_vpc.main.id}"

  # Conexão HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Conexão HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Conexão para o banco de dados MySql
  egress {
    from_port   = 3306 # Porta padrão do MySql
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.private_a_cidr}"] # Liberada a conexão apenas para a subnet privada
  }

  tags = {
    Name = "Web Server"
  }

}

resource "aws_security_group" "jenkins" {
  name   = "Jenkins"
  vpc_id = "${aws_vpc.main.id}"

  # Conexão HTTP
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins"
  }

}

resource "aws_security_group" "db" {
  name        = "Database"
  description = "Database Access"
  vpc_id      = "${aws_vpc.main.id}"

  # Conexão para o banco de dados MySql
  ingress {
    from_port       = 3306 # Porta padrão do MySql
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.web.id}"]
  }

  # Conexão SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database"
  }

}

resource "aws_security_group" "alb" {
  name        = "Load Balancer"
  description = "Load Balancer Security Group"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Load Balancer Security Group"
  }
}

resource "aws_security_group" "autoscaling" {
  name        = "autoscaling"
  description = "Security group that allows ssh/http and all egress traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.alb.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Auto Scaling"
  }

}
