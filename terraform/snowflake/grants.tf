# Grant the new roles to SYSADMIN (best practice)
resource "snowflake_grant_account_role" "grant_roles_to_sysadmin" {
  for_each = snowflake_account_role.custom_roles
  
  provider = snowflake.useradmin
  role_name = each.value.name
  parent_role_name = "SYSADMIN"
}

# Grant usage on the warehouse to the LOADER role
resource "snowflake_grant_privileges_to_account_role" "loader_warehouse_privileges" {
  provider          = snowflake.securityadmin
  account_role_name = "LOADER"
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = "LOADER_WH"
  }
  privileges = ["USAGE"]
}

# Grant usage on the database to the LOADER role
resource "snowflake_grant_privileges_to_account_role" "loader_database_privileges" {
  provider          = snowflake.securityadmin
  account_role_name = "LOADER"
  on_account_object {
    object_type = "DATABASE"
    object_name = "RAW"
  }
  privileges = ["USAGE", "CREATE SCHEMA"]
}

# Loader role future schemas in RAW database
resource "snowflake_grant_privileges_to_account_role" "future_schemas_privileges" {
  provider = snowflake.securityadmin
  account_role_name = "LOADER"
  on_schema {
    future_schemas_in_database = "RAW"
  }
  all_privileges = true
}

# Loader role future tables in RAW database
resource "snowflake_grant_privileges_to_account_role" "future_tables_privileges" {
  provider = snowflake.securityadmin
  account_role_name = "LOADER"
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database = "RAW"
    }
    
  }
  all_privileges = true
}

# Grant the LOADER role to svc_dlt
resource "snowflake_grant_account_role" "grants" {
    provider          = snowflake.useradmin
    role_name         = "LOADER"
    user_name         = "SVC_DLT"
}

# resource "snowflake_grant_privileges_to_account_role" "account_object_privileges" {
#   for_each = local.account_object_privileges
  
#   provider          = snowflake.securityadmin
#   account_role_name = each.value.role_name
#   on_account_object {
#     object_type = each.value.object_type
#     object_name = each.value.object_name
#   }
#   privileges = each.value.privileges
# }

# resource "snowflake_grant_privileges_to_account_role" "database_grants" {
#   for_each = local.database_role_privileges

#   account_role_name = each.value.role_name
#   privileges        = each.value.privileges

#   on_account_object {
#     object_type = "DATABASE"
#     object_name = each.value.database_name
#   }
# }

# ########################################
# # Future schema creation grants
# ########################################
# resource "snowflake_grant_privileges_to_account_role" "future_schema_grants" {
#   for_each = local.future_schema_privileges

#   account_role_name = each.value.role_name
#   privileges        = each.value.privileges

#   on_schema {
#     future_schemas_in_database = each.value.database_name
#   }
# }



