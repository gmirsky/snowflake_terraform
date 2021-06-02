snowflake_account_type = "standard"

environment_namespace = "demo"

snowflake_resource_monitor_credit_quota = 5

snowflake_resource_monitor_frequency = "DAILY"

snowflake_resource_monitor_notify_triggers = [85, 90, 95]

snowflake_resource_monitor_suspend_triggers = [100]

snowflake_resource_monitor_suspend_immediate_triggers = [110]

custom_tags = {
  Project = "Snowflake"
  Role    = "Snowflake cloud evaluation and testing"
}

users = {
  "terraform_test_user_1" = {
    login_name        = "terraform_test_user_1"
    comment           = "A user of snowflake."
    disabled          = true
    display_name      = "terraform_test_user_1"
    email             = "user1@donotreply.com"
    first_name        = "user"
    last_name         = "one"
    role              = "test_role_transformer"
    default_namespace = "test_database_1"
    warehouse         = "test_transformer_warehouse"
  }
  "terraform_test_user_2" = {
    login_name        = "terraform_test_user_2"
    comment           = "A user of snowflake."
    disabled          = true
    display_name      = "terraform_test_user_2"
    email             = "user2@donotreply.com"
    first_name        = "user"
    last_name         = "two"
    role              = "test_role_transformer"
    default_namespace = "test_database_1"
    warehouse         = "test_transformer_warehouse"
  }
  "terraform_test_user_3" = {
    login_name        = "terraform_test_user_3"
    comment           = "A user of snowflake."
    disabled          = true
    display_name      = "terraform_test_user_3"
    email             = "user3@donotreply.com"
    first_name        = "user"
    last_name         = "three"
    role              = "test_role_transformer"
    default_namespace = "test_database_1"
    warehouse         = "test_transformer_warehouse"
  }
  "terraform_test_user_4" = {
    login_name        = "terraform_test_user_4"
    comment           = "A user of snowflake."
    disabled          = true
    display_name      = "terraform_test_user_4"
    email             = "user4@donotreply.com"
    first_name        = "user"
    last_name         = "four"
    role              = "test_role_loader"
    default_namespace = "test_database_1"
    warehouse         = "test_loader_warehouse"
  }
}
schema = {
  "raw" = {
    database            = "test_database_1"
    comment             = "Contains raw data from our source systems"
    is_managed          = false
    is_transient        = false
    data_retention_days = 1
  }
  "analytics" = {
    database            = "test_database_1"
    comment             = "Contains tables and views accessible to analysts and reporting"
    is_managed          = false
    is_transient        = false
    data_retention_days = 1
  }
  "reporting" = {
    database            = "test_database_1"
    comment             = "Contains views accessible to clients for reporting"
    is_managed          = false
    is_transient        = false
    data_retention_days = 1
  }
}

# schema_grant must be database.schema format
# the module will separate the database and schema 
schema_grant = {
  "test_database_1.raw" = {
    privilege         = "USAGE"
    roles             = ["test_role_reports"]
    shares            = []
    with_grant_option = false
  }
  "test_database_1.analytics" = {
    privilege         = "USAGE"
    roles             = ["test_role_reports"]
    shares            = []
    with_grant_option = false
  }
  "test_database_1.reporting" = {
    privilege         = "USAGE"
    roles             = ["test_role_loader"]
    shares            = []
    with_grant_option = false
  }
}

role = {
  "test_role_loader" = {
    comment = "Owns the tables in the raw schema"
  }
  "test_role_transformer" = {
    comment = "Has query permissions on tables in the raw schema and owns tables in the analytics schema."
  }
  "test_role_reports" = {
    comment = "Reporting Role"
  }

}
role_grants = {
  "test_role_loader" = {
    roles = []
    users = [
      "terraform_test_user_1",
      "terraform_test_user_3"
    ]
  }
  "test_role_transformer" = {
    roles = []
    users = [
      "terraform_test_user_4"
    ]
  }
  "test_role_reports" = {
    roles = []
    users = [
      "terraform_test_user_2"
    ]
  }
}

warehouse = {
  "test_transformer_warehouse" = {
    auto_resume                  = true
    auto_suspend                 = 60
    comment                      = "Warehouse for data transformation"
    initially_suspended          = true
    max_cluster_count            = 1
    min_cluster_count            = 1
    resource_monitor             = null
    scaling_policy               = "STANDARD"
    statement_timeout_in_seconds = null
    wait_for_provisioning        = true
    warehouse_size               = "X-Small"
  }
  "test_loader_warehouse" = {
    auto_resume                  = true
    auto_suspend                 = 60
    comment                      = "Warehouse for data loading"
    initially_suspended          = true
    max_cluster_count            = 1
    min_cluster_count            = 1
    resource_monitor             = null
    scaling_policy               = "STANDARD"
    statement_timeout_in_seconds = null
    wait_for_provisioning        = true
    warehouse_size               = "X-Small"
  }
}

warehouse_grant = {
  "test_transformer_warehouse" = {
    privilege         = "USAGE"
    roles             = ["test_role_loader"]
    with_grant_option = false
  }
}

database = {
  "test_database_1" = {
    comment                     = "test database 1 comment"
    data_retention_time_in_days = 1
    from_database               = null
    from_share                  = null
  }
}

database_grant = {
  "test_database_1" = {
    privilege         = "USAGE"
    shares            = []
    with_grant_option = false
    roles = [
      "test_role_loader",
      "test_role_transformer",
      "test_role_reports"
    ]
  }
}

table = {
  "snowflake_test_table_csv" = {
    database   = "test_database_1"
    schema     = "raw"
    comment    = "A columnar test table called snowflake_test_table_csv to load CSV data"
    cluster_by = ["to_date(DATE)"]
    column = [
      {
        name = "id",
        type = "int"
      },
      {
        name = "data",
        type = "text"
      },
      {
        name = "DATE",
        type = "TIMESTAMP_NTZ(9)"
      }
    ]
  }
  "snowflake_test_table_json" = {
    database   = "test_database_1"
    schema     = "raw"
    comment    = "A variant column test table called snowflake_test_table_json to load JSON data"
    cluster_by = []
    column = [
      {
        name = "json_data",
        type = "variant"
      }
    ]
  }
  "snowflake_test_table_parquet" = {
    database   = "test_database_1"
    schema     = "raw"
    comment    = "A variant column test table called snowflake_test_table_parquet to load parquet data"
    cluster_by = []
    column = [
      {
        name = "parquet_data",
        type = "variant"
      }
    ]
  }
  "snowflake_test_table_avro" = {
    database   = "test_database_1"
    schema     = "raw"
    comment    = "A variant column test table called snowflake_test_table_avro to load Apache Avro data"
    cluster_by = []
    column = [
      {
        name = "avro_data",
        type = "variant"
      }
    ]
  }
  "snowflake_test_table_xml" = {
    database   = "test_database_1"
    schema     = "raw"
    comment    = "A variant column test table called snowflake_test_table_xml to load xml data"
    cluster_by = []
    column = [
      {
        name = "xml_data",
        type = "variant"
      }
    ]
  }
  "snowflake_test_table_orc" = {
    database   = "test_database_1"
    schema     = "raw"
    comment    = "A variant column test table called snowflake_test_table_orc to load Optimized Row Columnar (orc) data"
    cluster_by = []
    column = [
      {
        name = "id",
        type = "int"
      },
      {
        name = "product_description",
        type = "text"
      },
      {
        name = "product_sku",
        type = "text"
      }
    ]
  }

}

table_grant = {
  "test_database_1.raw.snowflake_test_table_csv" = {
    privilege = "SELECT"
    roles = [
      "test_role_loader",
      "test_role_transformer",
      "test_role_reports"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
  "test_database_1.raw.snowflake_test_table_json" = {
    privilege = "SELECT"
    roles = [
      "test_role_loader",
      "test_role_transformer",
      "test_role_reports"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
}

view = {
  "test_view_1" = {
    database           = "test_database_1"
    schema             = "raw"
    comment            = "A view based of a table called snowflake_test_table_csv"
    or_replace         = true # Overwrites the view if it exists.
    is_secure          = false
    sql_statement_path = "../sql/test_view_1.sql"
  }
}

s3_bucket_folder_name = [
  "snowflake_test_data/csv/",
  "snowflake_test_data/json/",
  "snowflake_test_data/parquet/",
  "snowflake_test_data/avro/",
  "snowflake_test_data/orc/",
  "snowflake_test_data/xml/"
]

stage_database = "test_database_1"

stage_schema = "raw"

# pipe must be database.schema.table_name (fully qualified table name) format!
pipe = {
  "test_database_1.raw.snowflake_test_table_csv" = {
    stage_name       = "snowflake_test_data_csv"
    auto_ingest      = true
    file_format_type = "CSV"
  }
  "test_database_1.raw.snowflake_test_table_json" = {
    stage_name       = "snowflake_test_data_json"
    auto_ingest      = true
    file_format_type = "JSON"
  }
  "test_database_1.raw.snowflake_test_table_avro" = {
    stage_name       = "snowflake_test_data_avro"
    auto_ingest      = true
    file_format_type = "AVRO"
  }
  "test_database_1.raw.snowflake_test_table_parquet" = {
    stage_name       = "snowflake_test_data_parquet"
    auto_ingest      = true
    file_format_type = "PARQUET"
  }
  "test_database_1.raw.snowflake_test_table_xml" = {
    stage_name       = "snowflake_test_data_xml"
    auto_ingest      = true
    file_format_type = "XML"
  }
}

# snowflake_cloud_stage_name = {
#   "snowflake_test_data/avro/" = "snowflake_test_data_avro"
#   "snowflake_test_data/csv/" = "snowflake_test_data_csv"
#   "snowflake_test_data/json/" = "snowflake_test_data_json"
#   "snowflake_test_data/orc/" = "snowflake_test_data_orc"
#   "snowflake_test_data/parquet/" = "snowflake_test_data_parquet"
#   "snowflake_test_data/text/" = "snowflake_test_data_text"
#   "snowflake_test_data/xml/" = "snowflake_test_data_xml"
