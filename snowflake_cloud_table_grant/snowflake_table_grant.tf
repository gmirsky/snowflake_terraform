# resource "snowflake_table_grant" "grant" {
#   for_each          = var.table_grant
#   database_name     = element(split(".", each.key), 0)
#   schema_name       = element(split(".", each.key), 1)
#   table_name        = element(split(".", each.key), 2)
#   privilege         = each.value.privilege
#   roles             = each.value.roles
#   shares            = each.value.shares
#   with_grant_option = each.value.with_grant_option
# }


# terraform import snowflake_table_grant.grant 'test_database_1|raw|test_table_1|SELECT|false'
# # snowflake_table_grant.grant:
# resource "snowflake_table_grant" "grant" {
#     database_name     = "test_database_1"
#     id                = "test_database_1|raw|test_table_1|SELECT|false"
#     on_future         = false
#     privilege         = "SELECT"
#     roles             = [
#         "test_role_loader",
#     ]
#     schema_name       = "raw"
#     shares            = []
#     table_name        = "test_table_1"
#     with_grant_option = false
# }

# Error: 002003 (42S02): SQL compilation error:
# │ Table '"test_database_1"."raw"."test_table_1"' does not exist or not authorized.
# │
# │   with snowflake_table_grant.grant,
# │   on snowflake_table_grant.tf line 1, in resource "snowflake_table_grant" "grant":
# │    1: resource "snowflake_table_grant" "grant" {
# │
# ╵