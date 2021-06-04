resource "aws_iam_user_policy_attachment" "snowflake_user" {
  user       = aws_iam_user.snowflake_user.name
  policy_arn = aws_iam_policy.snowflake_user.arn
}