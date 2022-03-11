output "pythonAppServerpublicip" {
  value = aws_instance.pythonAppServer.*.public_ip
}

output "webwerverpublicips" {
  value = aws_instance.webserver.*.public_ip
}

output "mysqlserverpublicips" {
  value = aws_instance.mysqlserver.*.public_ip
}


