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