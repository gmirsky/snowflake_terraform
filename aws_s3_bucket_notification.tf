resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = module.s3-bucket.s3_bucket_id
  dynamic "queue" {
    for_each = tomap(module.snowflake_cloud_pipe.sqs_notification_channel)
    content {
      id            = replace(queue.key, ".", "_")
      queue_arn     = queue.value
      events        = ["s3:ObjectCreated:*"]
      filter_prefix = "snowflake_test_data/${lower(one(regex("([^_]+$)", queue.key)))}/"
      filter_suffix = ".${lower(one(regex("([^_]+$)", queue.key)))}" #example:  .csv, .parquet, .json, etc.
    }
  }
}
