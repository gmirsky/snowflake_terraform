resource "tls_private_key" "svc_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
  for_each  = var.users
}
