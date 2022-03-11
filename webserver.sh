#!/bin/bash
  echo "*** Installing Web Server"
  sudo apt update -y
  sudo yum install httpd -y
  echo "Starting Web Service"
  sudo systemctl start httpd.service
  echo "*** Completed Installing Web Server"
