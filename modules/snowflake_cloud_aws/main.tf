module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.2.0"
  bucket  = var.snowflake_s3_bucket_name
  acl     = "private"
  versioning = {
    enabled = true
  }
  force_destroy                         = true
  attach_deny_insecure_transport_policy = true
  tags                                  = var.tags
}