
# # Create a new schema in the DB
# resource "snowflake_schema" "tf_db_tf_schema" {
#   name                = "TF_DEMO_SC"
#   database            = snowflake_database.tf_db.name
#   with_managed_access = false
# }

# # Create a key for the new user
# resource "tls_private_key" "svc_key" {
#     algorithm = "RSA"
#     rsa_bits  = 2048
# }

# # Create a new user
# resource "snowflake_user" "tf_user" {
#     provider          = snowflake.useradmin
#     name              = "TF_DEMO_USER"
#     default_warehouse = snowflake_warehouse.tf_warehouse.name
#     default_role      = snowflake_account_role.tf_role.name
#     default_namespace = "${snowflake_database.tf_db.name}.${snowflake_schema.tf_db_tf_schema.fully_qualified_name}"
#     rsa_public_key    = substr(tls_private_key.svc_key.public_key_pem, 27, 398)
# }

# # Grant the new role to the new user
# resource "snowflake_grant_account_role" "grants" {
#     provider          = snowflake.useradmin
#     role_name         = snowflake_account_role.tf_role.name
#     user_name         = snowflake_user.tf_user.name
# }

# # Grant usage on the database
# resource "snowflake_grant_privileges_to_account_role" "grant_usage_tf_db_to_tf_role" {
#     provider          = snowflake.useradmin
#     privileges        = ["USAGE"]
#     account_role_name = snowflake_account_role.tf_role.name
#     on_account_object {
#         object_type = "DATABASE"
#         object_name = snowflake_database.tf_db.name
#   }
# }

# # Grant usage on the schema
# resource "snowflake_grant_privileges_to_account_role" "grant_usage_tf_db_tf_schema_to_tf_role" {
#     provider          = snowflake.useradmin
#     privileges        = ["USAGE"]
#     account_role_name = snowflake_account_role.tf_role.name
#     on_schema {
#         schema_name = snowflake_schema.tf_db_tf_schema.fully_qualified_name
#   }
# }

# # Grant select on all tables in the schema (even if the schema is empty)
# resource "snowflake_grant_privileges_to_account_role" "grant_all_tables" {
#     provider          = snowflake.useradmin
#     privileges        = ["SELECT"]
#     account_role_name = snowflake_account_role.tf_role.name
#     on_schema_object {
#         all {
#             object_type_plural = "TABLES"
#             in_schema          = snowflake_schema.tf_db_tf_schema.fully_qualified_name
#     }
#   }
# }

# # Grant select on the future tables in the schema
# resource "snowflake_grant_privileges_to_account_role" "grant_future_tables" {
#     provider          = snowflake.useradmin
#     privileges        = ["SELECT"]
#     account_role_name = snowflake_account_role.tf_role.name
#     on_schema_object {
#         future {
#             object_type_plural = "TABLES"
#             in_schema          = snowflake_schema.tf_db_tf_schema.fully_qualified_name
#     }
#   }
# }

# output "snowflake_svc_public_key" {
#     value     = tls_private_key.svc_key.public_key_pem
# }

# output "snowflake_svc_private_key" {
#     value     = tls_private_key.svc_key.private_key_pem
#     sensitive = true
# }
