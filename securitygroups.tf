resource "aws_security_group" "project1webserversg" {
  name        = "project1-webserver-sg"
  description = "Project 1 Web Server Security Group"


  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
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
    Name           = "Webserver Server SG"
    environment    = var.environment
    business-owner = var.business_owner
    department     = var.dept
    Purpose        = var.purpose
    createddate    = timestamp()
  }
}

resource "aws_security_group" "project1dbserversg" {
  name        = "project1-dbserver-sg"
  description = "Database Server Inbound Acess"


  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "Allow MYSQL Listener"
    from_port   = 3306
    to_port     = 3306
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
    Name           = "Database Server Security Group"
    environment    = var.environment
    business-owner = var.business_owner
    department     = var.dept
    Purpose        = var.purpose
    createddate    = timestamp()
  }
}


resource "aws_security_group" "project1apython3" {
  name        = "project1a-python-sg"
  description = "Python Server Security Group"


  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

   ingress {
    description = "Allow Port 3000"
    from_port   = 3000
    to_port     = 3000
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
    Name           = "Python Server Security Group"
    environment    = var.environment
    business-owner = var.business_owner
    department     = var.dept
    Purpose        = var.purpose
    createddate    = timestamp()
  }
}