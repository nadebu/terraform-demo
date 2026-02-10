locals {
  snowflake_roles = {
    LOADER = {
      comment = "Used for data loading operations"
    }
    TRANSFORMER = {
      comment = "Used by developers for transforming and modelling data"
    }
    READER = {
      comment = "Read only role for query curated eg using BI tools"
    }
  }
}