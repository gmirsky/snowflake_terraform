resource "aws_iam_user" "snowflake_user" {
  name          = var.snowflake_s3_user
  path          = "/"
  tags          = var.tags
  force_destroy = true
}