resource "snowflake_table_grant" "grant" {
  for_each          = var.table_grant
  database_name     = element(split(".", each.key), 0)
  schema_name       = element(split(".", each.key), 1)
  table_name        = element(split(".", each.key), 2)
  privilege         = each.value.privilege
  roles             = each.value.roles
  shares            = each.value.shares
  with_grant_option = each.value.with_grant_option
}

# terraform import snowflake_table_grant.grant 'test_database_1|raw|snowflake_test_table_csv|SELECT|false'
# # snowflake_table_grant.grant:
# resource "snowflake_table_grant" "grant" {
#     database_name     = "test_database_1"
#     id                = "test_database_1|raw|snowflake_test_table_csv|SELECT|false"
#     on_future         = false
#     privilege         = "SELECT"
#     roles             = [
#         "test_role_loader",
#     ]
#     schema_name       = "raw"
#     shares            = []
#     table_name        = "snowflake_test_table_csv"
#     with_grant_option = false
# }

# ALTER USER my_terraform_account_admin_user_id SET QUOTED_IDENTIFIERS_IGNORE_CASE = true;

# │ Error: 002003 (42S02): SQL compilation error:
# │ Table 'TEST_DATABASE_1.RAW.snowflake_test_table_json' does not exist or not authorized.
# │
# │   with module.snowflake_cloud_table_grant.snowflake_table_grant.grant["test_database_1.raw.snowflake_test_table_json"],
# │   on snowflake_cloud_table_grant/snowflake_table_grant.tf line 1, in resource "snowflake_table_grant" "grant":
# │    1: resource "snowflake_table_grant" "grant" {
# │
# ╵
# ╷
# │ Error: 002003 (42S02): SQL compilation error:
# │ Table 'TEST_DATABASE_1.RAW.snowflake_test_table_csv' does not exist or not authorized.
# │
# │   with module.snowflake_cloud_table_grant.snowflake_table_grant.grant["test_database_1.raw.snowflake_test_table_csv"],
# │   on snowflake_cloud_table_grant/snowflake_table_grant.tf line 1, in resource "snowflake_table_grant" "grant":
# │    1: resource "snowflake_table_grant" "grant" {
# │
# ╵
# MacBook-Pro-3:snowflake_terraform gregorymirsky$