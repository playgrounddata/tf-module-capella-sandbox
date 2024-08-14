output "project_id" {
  value = module.couchbase_setup.project_id
}

output "cluster" {
  value = module.couchbase_setup.cluster_configuration
}

output "schedule" {
  value = module.couchbase_setup.cluster_onoff_schedule_configuration
}

output "sample_buckets_details" {
  value = module.couchbase_setup.custom_buckets_configuration
}

output "custom_buckets_details" {
  value = module.couchbase_setup.custom_buckets_configuration
}

output "db_user_credentials_custom_buckets" {
  value = module.couchbase_setup.db_user_credentials_custom_buckets
}

output "db_user_credentials_sample_buckets" {
  value = module.couchbase_setup.db_user_credentials_sample_buckets
}

output "cluster_allowed_access_cidr_ranges" {
  value = module.couchbase_setup.cluster_allowed_access_cidr_ranges
}

output "project_permissions_users" {
  value = module.couchbase_setup.project_permissions_users
}
