

resource "aws_instance" "pythonAppServer" {

  ami               = var.ami
  instance_type     = var.instance_type
  count             = var.instance_count
  availability_zone = "eu-west-2a"

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing Python 3"
  sudo apt update -y
  sudo yum install python3 -y
  sudo unlink /usr/bin/python
  sudo ln -s /usr/bin/python3 /usr/bin/python
  echo "*** Completed Installing Python 3.9"
  EOF

  tags = {
    Name           = "Python App Server"
    environment    = var.environment
    business-owner = var.business_owner
    department     = var.dept
    Purpose        = var.purpose
    createddate    = timestamp()
  }
  key_name        = var.key_name
  security_groups = [aws_security_group.project1apython3.name]
  
}

resource "aws_instance" "webserver" {
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_groups   =[aws_security_group.project1webserversg.name]
  availability_zone = "eu-west-2c"
  
  user_data         =  file ("webserver.sh") 
  


  tags = {
    Name           = "Web Server"
    environment    = var.environment
    business-owner = var.business_owner
    department     = var.dept
    Purpose        = var.purpose
    createddate    = timestamp()
  }

}


resource "aws_instance" "mysqlserver" {

  ami               = var.ami
  instance_type     = var.instance_type
  count             = var.instance_count
  availability_zone = "eu-west-2a"
  user_data         = <<-EOF
  #!/bin/bash
  echo "*** Installing MYSQL Server"
  sudo apt update -y
  sudo yum install mariadb-server -y
  sudo systemctl start mariadb
  sudo systemctl enable  mariadb
  mysqladmin -u root password "LetrAISc"
  #mysql -u root -p"LetrAISc" -e "UPDATE mysql.user SET Password=PASSWORD('LetrAISc') WHERE User='root'"
  #mysql -u root -p"LetrAISc" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
  #mysql -u root -p"LetrAISc" -e "DELETE FROM mysql.user WHERE User=''"
  #mysql -u root -p"LetrAISc" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
  #mysql -u root -p"LetrAISc" -e "FLUSH PRIVILEGES"
  sudo systemctl restart mariadb
  echo "Starting mysql Service"
  echo "*** Completed Installing MYSQL Server"
  EOF

  tags = {
    Name           = "MYSQL DB Server"
    environment    = var.environment
    business-owner = var.business_owner
    department     = var.dept
    Purpose        = var.purpose
    createddate    = timestamp()
  }
  key_name        = var.key_name
  security_groups = [aws_security_group.project1dbserversg.name] 
}

resource "aws_s3_bucket" "project1as3bucket" {
bucket = "project1a-s3-bucket"


tags = {
    Name           = "Project1A S3 Bucket"
    environment    = var.environment
    business-owner = var.business_owner
    department     = var.dept
    Purpose        = var.purpose
    createddate    = timestamp()
  }
}

resource "aws_db_instance" "resource" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  identifier           =  "resource"
  name                 = "project1amysqldb"
  username             = "admin"
  password             = var.dbpass
  #parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  availability_zone = "eu-west-2a"
  copy_tags_to_snapshot = true
  #allowmajor_version_upgrade = True
  backup_window = "02:00-03:00"
  tags = {
    Name           = "MYSQL DB Server"
    environment    = var.environment
    business-owner = var.business_owner
    department     = var.dept
    Purpose        = var.purpose
    createddate    = timestamp()
  }

  #security_group_names = [aws_security_group.project1dbserversg.name] 
  vpc_security_group_ids = [aws_security_group.project1dbserversg.id] 
}