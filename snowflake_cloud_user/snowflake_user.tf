resource "snowflake_user" "user" {
  for_each             = var.users
  name                 = each.key
  login_name           = each.value.login_name
  password             = var.default_user_password
  must_change_password = true
  comment              = each.value.comment
  disabled             = each.value.disabled
  display_name         = each.value.display_name
  email                = each.value.email
  first_name           = each.value.first_name
  last_name            = each.value.last_name
  default_role         = each.value.role
  default_warehouse    = each.value.warehouse
  default_namespace    = each.value.default_namespace
  rsa_public_key = substr(
    tls_private_key.svc_key[each.key].public_key_pem,
    27,
    398
  )
}
