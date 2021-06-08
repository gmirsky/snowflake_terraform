module "snowflake_cloud_database" {
  source           = "../../../modules/snowflake_cloud_database"
  database         = var.database
  snowflake_region = var.snowflake_region
}
