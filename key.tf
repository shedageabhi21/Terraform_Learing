resource "tls_private_key" "app_server_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "app_server_key" {
  key_name   = "app-server-key"
  public_key = tls_private_key.app_server_key.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.app_server_key.private_key_pem
  filename        = "/root/app_server_key.pem"
  file_permission = "0400"
}
