module "aws_user_tags" {
  custom_tags = var.custom_tags
  environment = var.environment_namespace
  source      = "../modules/aws_user_tags"
}

module "snowflake_cloud_aws" {
  source                   = "../modules/snowflake_cloud_aws"
  aws_region               = var.aws_region
  snowflake_s3_user        = local.snowflake_s3_user
  tags                     = module.aws_user_tags.tags
  environment_namespace    = var.environment_namespace
  snowflake_s3_bucket_name = local.snowflake_s3_bucket_name
  s3_bucket_folder_name    = var.s3_bucket_folder_name
}

module "snowflake_cloud_database" {
  source   = "../modules/snowflake_cloud_database"
  database = var.database
}

module "snowflake_cloud_database_grant" {
  source         = "../modules/snowflake_cloud_database_grant"
  database_grant = var.database_grant
  depends_on = [
    module.snowflake_cloud_database
  ]
}

module "snowflake_cloud_schema" {
  source = "../modules/snowflake_cloud_schema"
  schema = var.schema
  depends_on = [
    module.snowflake_cloud_database
  ]
}

module "snowflake_cloud_schema_grant" {
  source       = "../modules/snowflake_cloud_schema_grant"
  schema_grant = var.schema_grant
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_schema
  ]
}

module "snowflake_cloud_table" {
  source = "../modules/snowflake_cloud_table"
  table  = var.table
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_schema
  ]
}

module "snowflake_cloud_table_grant" {
  source      = "../modules/snowflake_cloud_table_grant"
  table_grant = var.table_grant
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_schema,
    module.snowflake_cloud_table
  ]
}

module "snowflake_cloud_stage" {
  source            = "../modules/snowflake_cloud_stage"
  stage_s3_urls     = local.stage_s3_urls
  stage_database    = var.stage_database
  stage_schema      = var.stage_schema
  stage_credentials = local.snowflake_s3_user_credentials
  depends_on = [
    module.snowflake_cloud_database,
    module.snowflake_cloud_schema,
    module.snowflake_cloud_aws,
  ]
}
