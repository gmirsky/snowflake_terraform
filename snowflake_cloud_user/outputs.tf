output "snowflake_svc_public_key" {
  value = {
    for k, v in tls_private_key.svc_key : k => v.public_key_pem
  }
  sensitive = false
}

output "snowflake_svc_public_key_openssh" {
  value = {
    for k, v in tls_private_key.svc_key : k => v.public_key_openssh
  }
  sensitive = false
}

output "snowflake_svc_public_key_fingerprint_md5" {
  value = {
    for k, v in tls_private_key.svc_key : k => v.public_key_fingerprint_md5
  }
  sensitive = false
}

output "snowflake_svc_private_key" {
  value = {
    for k, v in tls_private_key.svc_key : k => v.private_key_pem
  }
  sensitive = true
}