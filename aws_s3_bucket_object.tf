resource "aws_s3_bucket_object" "snowflake_folders" {
  for_each               = local.s3_bucket_folder_name
  key                    = each.key
  bucket                 = module.s3-bucket.s3_bucket_id
  server_side_encryption = "AES256"
  tags                   = module.aws_user_tags.tags
}
