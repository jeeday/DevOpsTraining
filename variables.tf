variable "ami" {
  default = "ami-0dd555eb7eb3b7c82"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_count" {
  default = 1

}

variable "environment" {
  default = "Project 1  A"
}

variable "business_owner" {
  default = "Head of IT"
}

variable "dept" {
  default = "IT"
}

variable "purpose" {
  default = "Demo for DevOps Training"
}

variable "key_name" {
  default = "AWSLinuxInstanceKeyPair"
}


variable "RemoteConnection" {
  default = ["RemoteConnection"]
}

variable "project1-webserver-sg" {
  default = ["project1-webserver-sg"]
}

variable "project1-dbserver-sg" {
  default = ["project1-dbserver-sg"]
}

variable "project1a-python-sg" {
  default = ["project1a-python-sg"]
}

variable "dbpass" {
  default = "Pz3*t8f6R$luOrJ*"
}


