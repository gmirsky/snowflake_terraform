module "aws_user_tags" {
  custom_tags = var.custom_tags
  environment = var.environment_namespace
  source      = "./aws_user_tags"
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.2.0"
  bucket  = local.snowflake_s3_bucket_name
  acl     = "private"
  versioning = {
    enabled = true
  }
  force_destroy                         = true
  attach_deny_insecure_transport_policy = true
  tags                                  = module.aws_user_tags.tags
  lifecycle_rule = [
    {
      id      = "${var.s3_bucket_folder_name}"
      enabled = true
      prefix  = "${var.s3_bucket_folder_name}/"
      tags    = module.aws_user_tags.tags
      transition = [
        {
          days          = 30
          storage_class = "ONEZONE_IA"
        }
      ]
      expiration = {
        days = 90
      }
      noncurrent_version_expiration = {
        days = 30
      }
    }
  ]
}
