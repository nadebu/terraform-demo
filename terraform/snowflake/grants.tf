# Grant the new roles to SYSADMIN (best practice)
resource "snowflake_grant_account_role" "grant_roles_to_sysadmin" {
  for_each = snowflake_account_role.custom_roles
  
  provider = snowflake.useradmin
  role_name = each.value.name
  parent_role_name = "SYSADMIN"
}

resource "snowflake_grant_privileges_to_account_role" "account_object_privileges" {
  for_each = local.account_object_privileges
  
  provider          = snowflake.securityadmin
  account_role_name = each.value.role_name
  on_account_object {
    object_type = each.value.object_type
    object_name = each.value.object_name
  }
  privileges = each.value.privileges
}

# Grant roles future schema privileges in their respective databases
resource "snowflake_grant_privileges_to_account_role" "future_schemas_privileges" {
  for_each = local.future_schema_privileges
  
  provider = snowflake.securityadmin
  account_role_name = each.value.role_name
  on_schema {
    future_schemas_in_database = each.value.database_name
  }
  all_privileges = true
}


# Grant roles future table privileges in their respective databases. Uses the same 

resource "snowflake_grant_privileges_to_account_role" "future_tables_privileges" {
  for_each = local.future_schema_privileges

  provider = snowflake.securityadmin

  account_role_name = each.value.role_name
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database = each.value.database_name
    }
  }
  all_privileges = true
}

# Grant roles warehouse usage privileges
resource "snowflake_grant_account_role" "grants_loader_wh" {
    provider          = snowflake.useradmin
    role_name         = "LOADER"
    user_name         = "SVC_DLT"
}

resource "snowflake_grant_account_role" "grants_transformer_wh" {
    provider          = snowflake.useradmin
    role_name         = "TRANSFORMER"
    user_name         = "SVC_DBT"
}

# all schemas in database
resource "snowflake_grant_privileges_to_account_role" "transformer_all_schemas_raw" {
  provider = snowflake.securityadmin
  privileges        = ["USAGE"]
  account_role_name = "TRANSFORMER"
  on_schema {
    all_schemas_in_database = "RAW"
  }
}


resource "snowflake_grant_privileges_to_account_role" "transformer_all_tables_raw" {
  provider = snowflake.securityadmin
  privileges        = ["SELECT"]
  account_role_name = "TRANSFORMER"
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = "RAW"
    }
  }
}

