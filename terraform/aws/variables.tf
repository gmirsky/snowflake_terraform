variable "aws_region" {
  type        = string
  description = "AWS acccount region"
  default     = "us-east-1"
  sensitive   = false
}

variable "custom_tags" {
  description = "Custom tags to be included"
  type        = map(any)
  sensitive   = false
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

variable "s3_bucket_folder_name" {
  type        = list(string)
  description = "folders name(s) to create so that snowflake can access"
  default     = []
  sensitive   = false
}