variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}


variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "bastion_machine" {
  type    = string
  default = "e2-micro"
}

variable "location" {
  type    = string
  default = "us-central1"  # For KMS
}

variable "vpc_name" {
  type    = string
  default = "mysql-vpc"
}

variable "subnet_cidr" {
  type    = string
  default = "10.10.0.0/24"
}

variable "db_tier" {
  type    = string
  default = "db-custom-2-7680"
}

variable "db_name" {
  type    = string
  default = "mysql-db"
}

variable "db_password" {
  type      = string
  sensitive = true
}
