resource "tls_private_key" "demo" {
  algorithm = "RSA"
}

resource "aws_key_pair" "key_pair" {
  public_key = tls_private_key.demo.public_key_openssh
  key_name = var.key_pair_name
}

resource "local_sensitive_file" "pem_file" {
  #filename = pathexpand("~/.ssh/${var.key_pair_name}.pem")
  filename = pathexpand("~/.ssh/${aws_key_pair.key_pair.key_name}.pem")
  file_permission = "600"
  directory_permission = "700"
  content = tls_private_key.demo.private_key_pem
}