resource "aws_s3_bucket_object" "snowflake_folders" {
  for_each               = local.s3_bucket_folder_name
  key                    = each.key
  bucket                 = var.snowflake_s3_bucket_name
  server_side_encryption = "AES256"
  tags                   = var.tags
  depends_on = [
    module.s3-bucket
  ]
}
