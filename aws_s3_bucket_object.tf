resource "aws_s3_bucket_object" "snowflake_folder_csv" {
  key                    = "${var.s3_bucket_folder_name}/csv/"
  bucket                 = module.s3-bucket.s3_bucket_id
  server_side_encryption = "AES256"
  tags        = module.aws_user_tags.tags
}
resource "aws_s3_bucket_object" "snowflake_folder_text" {
  key                    = "${var.s3_bucket_folder_name}/text/"
  bucket                 = module.s3-bucket.s3_bucket_id
  server_side_encryption = "AES256"
  tags        = module.aws_user_tags.tags
}

resource "aws_s3_bucket_object" "snowflake_folder_json" {
  key                    = "${var.s3_bucket_folder_name}/json/"
  bucket                 = module.s3-bucket.s3_bucket_id
  server_side_encryption = "AES256"
  tags        = module.aws_user_tags.tags
}

resource "aws_s3_bucket_object" "snowflake_folder_parquet" {
  key                    = "${var.s3_bucket_folder_name}/parquet/"
  bucket                 = module.s3-bucket.s3_bucket_id
  server_side_encryption = "AES256"
  tags        = module.aws_user_tags.tags
}

resource "aws_s3_bucket_object" "snowflake_folder_avro" {
  key                    = "${var.s3_bucket_folder_name}/avro/"
  bucket                 = module.s3-bucket.s3_bucket_id
  server_side_encryption = "AES256"
  tags        = module.aws_user_tags.tags
}

resource "aws_s3_bucket_object" "snowflake_folder_orc" {
  key                    = "${var.s3_bucket_folder_name}/orc/"
  bucket                 = module.s3-bucket.s3_bucket_id
  server_side_encryption = "AES256"
  tags        = module.aws_user_tags.tags
}

resource "aws_s3_bucket_object" "snowflake_folder_xml" {
  key                    = "${var.s3_bucket_folder_name}/xml/"
  bucket                 = module.s3-bucket.s3_bucket_id
  server_side_encryption = "AES256"
  tags        = module.aws_user_tags.tags
}
