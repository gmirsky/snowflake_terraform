environment_namespace = "demo"
snowflake_role        = "SYSADMIN"
snowflake_region      = "us-east-1"
custom_tags = {
  Project     = "Snowflake"
  Role        = "Snowflake cloud evaluation and testing"
  Company     = "01"
  Division    = "002"
  Department  = "1234"
  Ledger-Code = "123456"
}

s3_bucket_folder_name = [
  "snowflake_test_data/csv/",
  "snowflake_test_data/json/",
  "snowflake_test_data/parquet/",
  "snowflake_test_data/avro/",
  "snowflake_test_data/orc/",
  "snowflake_test_data/xml/"
]

database = {
  "test_database_1" = {
    comment                     = "This a comment about test database 1"
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
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
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
    privilege = "USAGE"
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    with_grant_option = false
  }
  "test_database_1.analytics" = {
    privilege = "USAGE"
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    with_grant_option = false
  }
  "test_database_1.reporting" = {
    privilege = "USAGE"
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    with_grant_option = false
  }
}

table = {
  "snowflake_test_table_csv" = {
    database   = "test_database_1"
    schema     = "raw"
    comment    = "A columnar test table called snowflake_test_table_csv to load CSV data"
    cluster_by = ["country_code"]
    column = [
      {
        name = "email",
        type = "text"
      },
      {
        name = "country_code",
        type = "text"
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

# format must be "database.schema.table.privilege"
table_grant = {
  "test_database_1.raw.snowflake_test_table_csv.select" = {
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
  "test_database_1.raw.snowflake_test_table_csv.update" = {
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
  "test_database_1.raw.snowflake_test_table_csv.insert" = {
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
  "test_database_1.raw.snowflake_test_table_csv.references" = {
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
  "test_database_1.raw.snowflake_test_table_csv.update" = {
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
  "test_database_1.raw.snowflake_test_table_json.select" = {
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
  "test_database_1.raw.snowflake_test_table_json.update" = {
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
  "test_database_1.raw.snowflake_test_table_json.insert" = {
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
  "test_database_1.raw.snowflake_test_table_json.references" = {
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
  "test_database_1.raw.snowflake_test_table_json.update" = {
    roles = [
      "SYSADMIN",
      "SECURITYADMIN",
      "ACCOUNTADMIN",
      "PUBLIC"
    ]
    shares            = []
    on_future         = false
    with_grant_option = false
  }
}