resource "aws_iam_user_policy_attachment" "snowflake_user" {
  user       = local.snowflake_s3_user
  policy_arn = aws_iam_policy.snowflake_user.arn
}