variable "aws_region" {
  type        = string
  description = "AWS acccount region"
  default     = "us-east-1"
  sensitive   = false
}

variable "snowflake_s3_user" {
  type = string
  description = "Snowflake S3 User Name"
  sensitive =  false 
}

variable "snowflake_s3_bucket_name" {
  type = string
  description = "Snowflake S3 bucket name"
  sensitive = false 
}

variable "environment_namespace" {
  type        = string
  description = "Environment namespace (demo, dev, test, qa, prod)"
  default     = "demo"
  sensitive   = false
  validation {
    condition = can(
      regex(
        "demo|dev|test|qa|prod",
        var.environment_namespace
      )
    )
    error_message = "ERROR: environment must be of type: dev, test, qa, prod."
  }
}

variable "tags" {
  type = map(any)
  description = "Map of tags to apply to resources."
  sensitive =  false 
}

variable "s3_bucket_folder_name" {
  type        = list(string)
  description = "folders name(s) to create so that snowflake can access"
  default     = []
  sensitive   = false
}