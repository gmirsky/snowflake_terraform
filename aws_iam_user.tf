resource "aws_iam_user" "snowflake_user" {
  name          = local.snowflake_s3_user
  path          = "/"
  tags          = module.aws_user_tags.tags
  force_destroy = true
}