module "aws_user_tags" {
  custom_tags = var.custom_tags
  environment = var.environment_namespace
  source      = "../../modules/aws_user_tags"
}

module "snowflake_cloud_aws" {
  source                   = "../../modules/snowflake_cloud_aws"
  aws_region               = var.aws_region
  snowflake_s3_user        = local.snowflake_s3_user
  tags                     = module.aws_user_tags.tags
  environment_namespace    = var.environment_namespace
  snowflake_s3_bucket_name = local.snowflake_s3_bucket_name
  s3_bucket_folder_name    = var.s3_bucket_folder_name
}
