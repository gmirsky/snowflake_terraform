provider "aws" {
  region = var.aws_region
}

provider "snowflake" {
  role     = "ACCOUNTADMIN"
  username = ""
  account  = ""
  region   = ""
  #
  # optional parameters but at least one must be set
  password = ""
  #
  # oauth_access_token    = "..."
  # private_key_path      = "..."
  # private_key           = "..."
  # oauth_refresh_token   = "..."
  # oauth_client_id       = "..."
  # oauth_client_secret   = "..."
  # oauth_endpoint        = "..."
  # oauth_redirect_url    = "..."
  #
}
