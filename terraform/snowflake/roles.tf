# Create a new role using USERADMIN
resource "snowflake_account_role" "loader_role" {
    provider          = snowflake.useradmin
    name              = "LOADER"
    comment           = "Used for data loading operations"
}

resource "snowflake_account_role" "reader_role" {
    provider          = snowflake.useradmin
    name              = "READER"
    comment           = "Used for data reading operations such as BI tools"
}

resource "snowflake_account_role" "developer_role" {
    provider          = snowflake.useradmin
    name              = "DEVELOPER"
    comment           = "Used for data development operations such as ETL and data modeling"
}