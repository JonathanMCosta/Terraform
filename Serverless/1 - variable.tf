variable "region" {
  default = "us-east-1"
}

variable "account_id" {
  default = "186413429892" #Altera esse valor para o ID da sua conta
}

variable "env" {
  default = "dev"
}
variable "cg_pool" {
  default = "Application"
}

variable "cg_client" {
  default = "application-app-client"
}

variable "cg_domain" {
  default = "application-api"
}

variable "dbname" {
  default = "application"
}

variable "read_capacity" {
  default = 5
}

variable "write_capacity" {
  default = 5
}

variable "api_name" {
  default = "application terraform"
}

variable "api_description" {
  default = "API built with Terraform"
}

variable "sns_topic_name" {
  default = "s3-data-drop"
}
