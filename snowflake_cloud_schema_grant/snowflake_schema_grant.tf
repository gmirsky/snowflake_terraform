# resource "snowflake_schema_grant" "schema_grant" {
#   for_each          = var.schemas
#   schema_name       = each.key
#   database_name     = each.value.database
#   privilege         = "USAGE"
#   roles             = each.value.usage_roles
#   shares            = []
#   with_grant_option = false
# }

