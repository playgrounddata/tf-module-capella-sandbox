########################################################################
# Outputs
########################################################################
output "project_id" {
  description = "The ID of the Couchbase Capella project."
  value       = couchbase-capella_project.default.id
}

output "cluster_configuration" {
  description = "The configuration of the Couchbase Capella cluster."
  value       = couchbase-capella_cluster.default
}

output "cluster_onoff_schedule_configuration" {
  description = "The configuration of the Couchbase Capella cluster on/off schedule."
  value       = couchbase-capella_cluster_onoff_schedule.default
}

output "custom_buckets_configuration" {
  description = "The configuration of the custom buckets."
  value       = couchbase-capella_bucket.custom_bucket
}

output "sample_buckets_configuration" {
  description = "The configuration of the sample buckets."
  value       = couchbase-capella_sample_bucket.sample_bucket
}

output "db_user_credentials_custom_buckets" {
  description = "The details of database user credentials for custom buckets."
  value = { for u in couchbase-capella_database_credential.custom_db_user : u.name => {
    id   = u.id
    name = u.name

  } }
}

output "db_user_credentials_sample_buckets" {
  description = "The details of database user credentials for sample buckets."
  value = { for u in couchbase-capella_database_credential.sample_db_user : u.name => {
    id   = u.id
    name = u.name
  } }
}

output "cluster_allowed_access_cidr_ranges" {
  description = "The allowed IPs for the Couchbase Capella cluster."
  value       = { for a in couchbase-capella_allowlist.default : a.cidr => a.id }
}

output "project_permissions_users" {
  description = "The user details with permissions on the Couchbase Capella project."
  value = { for u in couchbase-capella_user.default : u.name => {
    email = u.email
    roles = u.organization_roles
  } }
}
