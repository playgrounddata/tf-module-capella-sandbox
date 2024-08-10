########################################################################
# Projects
########################################################################
resource "couchbase-capella_project" "default_project" {
  organization_id = var.organization_id
  name            = var.project_name
  description     = var.project_description
}

########################################################################
# Cluster
########################################################################
resource "couchbase-capella_cluster" "default_cluster" {
  organization_id = var.organization_id
  project_id      = couchbase-capella_project.default_project.id
  name            = var.cluster_name

  availability = {
    type = var.cluster_availability
  }

  cloud_provider = {
    cidr   = var.cluster_cidr_range
    region = var.region
    type   = var.cloud_provider
  }

  service_groups = [{
    node = {
      compute = {
        cpu = var.cluster_node_cpu
        ram = var.cluster_node_ram
      }
      disk = {
        storage = var.cluster_node_disk_size
        type    = var.cluster_node_disk_type
        iops    = var.cluster_node_iops
      }
    }
    num_of_nodes = var.cluster_nodes
    services     = var.cluster_services
  }]

  support = {
    plan     = var.cluster_service_support
    timezone = var.cluster_service_support_timezone
  }

}

########################################################################
# Custom buckets
########################################################################
resource "couchbase-capella_bucket" "custom_bucket" {
  for_each = { for idx, bucket in var.buckets_config : idx => bucket }

  name                       = each.value.name
  organization_id            = var.organization_id
  project_id                 = couchbase-capella_project.default_project.id
  cluster_id                 = couchbase-capella_cluster.default_cluster.id
  type                       = lookup(each.value, "type", "couchbase")
  storage_backend            = lookup(each.value, "storage_backend", "couchstore")
  memory_allocation_in_mb    = lookup(each.value, "memory_allocation_in_mb", 100)
  bucket_conflict_resolution = lookup(each.value, "bucket_conflict_resolution", "seqno")
  durability_level           = lookup(each.value, "durability_level", "none")
  replicas                   = lookup(each.value, "replicas", 1)
  flush                      = lookup(each.value, "flush", false)
  time_to_live_in_seconds    = lookup(each.value, "time_to_live_in_seconds", 0)
  eviction_policy            = lookup(each.value, "eviction_policy", "fullEviction")
}

resource "couchbase-capella_database_credential" "custom_db_user" {
  for_each = couchbase-capella_bucket.custom_bucket

  name            = "${each.value.name}_db_user"
  organization_id = var.organization_id
  project_id      = couchbase-capella_project.default_project.id
  cluster_id      = couchbase-capella_cluster.default_cluster.id

  access = [
    {
      privileges = ["data_writer"]
      resources = {
        buckets = [{
          name = each.value.name
        }]
      }
    }
  ]
}

########################################################################
# Sample data buckets
########################################################################
resource "couchbase-capella_sample_bucket" "sample_bucket" {
  for_each = toset(var.bucket_sample_content)

  name            = each.key
  organization_id = var.organization_id
  project_id      = couchbase-capella_project.default_project.id
  cluster_id      = couchbase-capella_cluster.default_cluster.id
}

resource "couchbase-capella_database_credential" "sample_db_user" {
  for_each = couchbase-capella_sample_bucket.sample_bucket

  name            = "${each.value.name}_db_user"
  organization_id = var.organization_id
  project_id      = couchbase-capella_project.default_project.id
  cluster_id      = couchbase-capella_cluster.default_cluster.id

  access = [
    {
      privileges = ["data_writer"]
      resources = {
        buckets = [{
          name = each.value.name
        }]
      }
    }
  ]
}

########################################################################
# Scheduling turn on / off of cluster
########################################################################
resource "couchbase-capella_cluster_onoff_schedule" "default_schedule" {
  organization_id = var.organization_id
  project_id      = couchbase-capella_project.default_project.id
  cluster_id      = couchbase-capella_cluster.default_cluster.id
  timezone        = "Europe/Amsterdam"

  days = [
    for day in var.cluster_schedule : {
      day   = day.day
      state = day.state
      from  = day.state == "custom" ? day.from : null
      to    = day.state == "custom" ? day.to : null
    }
  ]
}

########################################################################
# Allowed IP:s
########################################################################
resource "couchbase-capella_allowlist" "default_allow_list" {
  for_each = { for i, cidr in var.cluster_allowed_access_cidr_range : i => cidr }

  organization_id = var.organization_id
  project_id      = couchbase-capella_project.default_project.id
  cluster_id      = couchbase-capella_cluster.default_cluster.id
  cidr            = each.value
}


########################################################################
# Project permissions
########################################################################
resource "couchbase-capella_user" "default_users" {
  for_each = { for i, user in var.project_permissions_users : i => user }

  organization_id    = var.organization_id
  name               = each.value.name
  email              = each.value.email
  organization_roles = ["organizationMember"]

  resources = [{
    id    = couchbase-capella_project.default_project.id
    roles = each.value.roles
  }]

}
