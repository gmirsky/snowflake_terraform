resource "aws_iam_policy" "snowflake_user" {
  name        = "snowflake_user_s3_policy"
  description = "Policy to allow the user to access the Snowflake S3 bucket"
  tags        = module.aws_user_tags.tags
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "s3:PutObject",
            "s3:GetObject",
            "s3:GetObjectVersion",
            "s3:DeleteObject",
            "s3:DeleteObjectVersion"
          ],
          "Resource" : [
            "arn:aws:s3:::${local.snowflake_s3_bucket_name}/*"
          ]
        },
        {
          "Effect" : "Allow",
          "Action" : "s3:ListBucket",
          "Resource" : "arn:aws:s3:::${local.snowflake_s3_bucket_name}"
        }
      ]
    }
  )
}
