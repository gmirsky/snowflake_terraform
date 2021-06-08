module "snowflake_cloud_database" {
  source   = "./modules/snowflake_cloud_database"
  database = var.database
}

module "snowflake_cloud_warehouse" {
  source                 = "./modules/snowflake_cloud_warehouse"
  warehouse              = var.warehouse
  snowflake_account_type = var.snowflake_account_type
}

module "snowflake_cloud_warehouse_grant" {
  source          = "./modules/snowflake_cloud_warehouse_grant"
  warehouse_grant = var.warehouse_grant
  depends_on = [
    module.snowflake_cloud_warehouse,
    module.snowflake_cloud_role
  ]
}

module "snowflake_cloud_role" {
  source = "./modules/snowflake_cloud_role"
  role   = var.role
}

module "snowflake_cloud_user" {
  source = "./modules/snowflake_cloud_user"
  users  = var.users
  depends_on = [
    module.snowflake_cloud_role,
    module.snowflake_cloud_warehouse
  ]
}

module "snowflake_cloud_schema" {
  source = "./modules/snowflake_cloud_schema"
  schema = var.schema
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_role
  ]
}

module "snowflake_cloud_schema_grant" {
  source       = "./modules/snowflake_cloud_schema_grant"
  schema_grant = var.schema_grant
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_role,
    module.snowflake_cloud_schema
  ]
}

module "snowflake_cloud_database_grant" {
  source         = "./modules/snowflake_cloud_database_grant"
  database_grant = var.database_grant
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_role
  ]
}

# module "snowflake_cloud_role_grants" {
#   source      = "./modules/snowflake_cloud_role_grants"
#   role_grants = var.role_grants
#   depends_on = [
#     module.snowflake_cloud_role,
#     module.snowflake_cloud_user
#   ]
# }

module "snowflake_cloud_table" {
  source = "./modules/snowflake_cloud_table"
  table  = var.table
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_schema
  ]
}

module "snowflake_cloud_stage" {
  source            = "./modules/snowflake_cloud_stage"
  stage_s3_urls     = local.stage_s3_urls
  stage_database    = var.stage_database
  stage_schema      = var.stage_schema
  stage_credentials = local.snowflake_s3_user_credentials
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_schema,
    aws_s3_bucket_object.snowflake_folders,
    aws_iam_access_key.snowflake_user
  ]
}

module "snowflake_cloud_pipe" {
  source = "./modules/snowflake_cloud_pipe"
  pipe   = var.pipe
  depends_on = [
    module.snowflake_cloud_stage
  ]
}











# module "snowflake_cloud_table_grant" {
#   source      = "./modules/snowflake_cloud_table_grant"
#   #count = 0
#   table_grant = var.table_grant
#   depends_on = [
#     module.snowflake_cloud_database,
#     module.snowflake_cloud_schema,
#     module.snowflake_cloud_role
#   ]
# }

# resource "snowflake_table_grant" "grant" {
#   database_name = "test_database_1"
#   #id                = "test_database_1|raw|snowflake_test_table_csv|SELECT|false"
#   #on_future = false
#   privilege = "SELECT"
#   roles = [
#     "test_role_loader",
#   ]
#   schema_name       = "raw"
#   shares            = []
#   table_name        = "snowflake_test_table_csv"
#   with_grant_option = false
#   depends_on = [
#     module.snowflake_cloud_database,
#     module.snowflake_cloud_schema,
#     module.snowflake_cloud_role
#   ]
# }

#   ╷
# │ Error: 002003 (42S02): SQL compilation error:
# │ Table 'TEST_DATABASE_1.RAW.snowflake_test_table_csv' does not exist or not authorized.
# │
# │   with snowflake_table_grant.grant,
# │   on modules_snowflake.tf line 91, in resource "snowflake_table_grant" "grant":
# │   91: resource "snowflake_table_grant" "grant" {
# │
# ╵


# module "snowflake_cloud_view" {
#   source = "./modules/snowflake_cloud_view"
#   view   = var.view
#   depends_on = [
#     module.snowflake_cloud_database,
#     module.snowflake_cloud_schema,
#     module.snowflake_cloud_table
#   ]
# }
