resource "aws_iam_access_key" "snowflake_user" {
  user = aws_iam_user.snowflake_user.name
}