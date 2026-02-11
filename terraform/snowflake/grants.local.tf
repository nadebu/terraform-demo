locals {

  ########################################
  # Account-level object privileges
  # (DATABASE, WAREHOUSE)
  ########################################

  account_object_privileges = {

    # ----- LOADER -----
    loader_wh = {
      role_name   = "LOADER"
      object_type = "WAREHOUSE"
      object_name = "LOADER_WH"
      privileges  = ["USAGE"]
    }

    raw_loader_db = {
      role_name   = "LOADER"
      object_type = "DATABASE"
      object_name = "RAW"
      privileges  = ["USAGE", "CREATE SCHEMA"]
    }

    # ----- TRANSFORMER -----
    transformer_wh_transformer = {
      role_name   = "TRANSFORMER"
      object_type = "WAREHOUSE"
      object_name = "TRANSFORMER_WH"
      privileges  = ["USAGE"]
    }

    raw_transformer_db = {
      role_name   = "TRANSFORMER"
      object_type = "DATABASE"
      object_name = "RAW"
      privileges  = ["USAGE"]
    }

    analytics_dev_transformer_db = {
      role_name   = "TRANSFORMER"
      object_type = "DATABASE"
      object_name = "ANALYTICS_DEV"
      privileges  = ["USAGE", "ALL", "CREATE SCHEMA"]
    }


    analytics_transformer_db = {
      role_name   = "TRANSFORMER"
      object_type = "DATABASE"
      object_name = "ANALYTICS"
      privileges  = ["USAGE", "ALL", "CREATE SCHEMA"]
    }

    # ----- READER -----
    raw_reader_db = {
      role_name   = "READER"
      object_type = "DATABASE"
      object_name = "RAW"
      privileges  = ["USAGE"]
    }

    analytics_reader_db = {
      role_name   = "READER"
      object_type = "DATABASE"
      object_name = "ANALYTICS"
      privileges  = ["USAGE"]
    }

    reader_wh = {
      role_name   = "READER"
      object_type = "WAREHOUSE"
      object_name = "READER_WH"
      privileges  = ["USAGE"]
    }
  }

########################################
  # Future schema creation privileges
  ########################################
  future_schema_privileges = {

    # Allow roles to create schemas in their databases
    loader_raw = {
      role_name     = "LOADER"
      database_name = "RAW"
    }

    transformer_analytics_raw = {
      role_name     = "TRANSFORMER"
      database_name = "RAW"
    }

    transformer_analytics_dev = {
      role_name     = "TRANSFORMER"
      database_name = "ANALYTICS_DEV"
    }

    transformer_analytics = {
      role_name     = "TRANSFORMER"
      database_name = "ANALYTICS"
    }
  }

}