module "snowflake_cloud_database" {
  source   = "./snowflake_cloud_database"
  database = var.database
}

module "snowflake_cloud_warehouse" {
  source                 = "./snowflake_cloud_warehouse"
  warehouse              = var.warehouse
  snowflake_account_type = var.snowflake_account_type
}

module "snowflake_cloud_warehouse_grant" {
  source          = "./snowflake_cloud_warehouse_grant"
  warehouse_grant = var.warehouse_grant
  depends_on = [
    module.snowflake_cloud_warehouse,
    module.snowflake_cloud_role
  ]
}

module "snowflake_cloud_role" {
  source = "./snowflake_cloud_role"
  role   = var.role
}

module "snowflake_cloud_user" {
  source = "./snowflake_cloud_user"
  users  = var.users
  depends_on = [
    module.snowflake_cloud_role,
    module.snowflake_cloud_warehouse
  ]
}

module "snowflake_cloud_schema" {
  source = "./snowflake_cloud_schema"
  schema = var.schema
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_role
  ]
}

module "snowflake_cloud_schema_grant" {
  source       = "./snowflake_cloud_schema_grant"
  schema_grant = var.schema_grant
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_role,
    module.snowflake_cloud_schema
  ]
}

module "snowflake_cloud_database_grant" {
  source         = "./snowflake_cloud_database_grant"
  database_grant = var.database_grant
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_role
  ]
}

module "snowflake_cloud_role_grants" {
  source      = "./snowflake_cloud_role_grants"
  role_grants = var.role_grants
  depends_on = [
    module.snowflake_cloud_role,
    module.snowflake_cloud_user
  ]
}

module "snowflake_cloud_table" {
  source = "./snowflake_cloud_table"
  table  = var.table
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_schema
  ]
}

module "snowflake_cloud_table_grant" {
  source      = "./snowflake_cloud_table_grant"
  table_grant = var.table_grant
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_schema,
    module.snowflake_cloud_role
  ]
}

# module "snowflake_cloud_view" {
#   source = "./snowflake_cloud_view"
#   view   = var.view
#   depends_on = [
#     module.snowflake_cloud_database,
#     module.snowflake_cloud_schema,
#     module.snowflake_cloud_table
#   ]
# }
