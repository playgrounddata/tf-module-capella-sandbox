# single-node-cluster-example
This example deploys a single-node cluster on AWS.

### Usage
```terraform
### Single node cluster deployment

module "couchbase_setup" {
  source              = "git::https://github.com/playgrounddata/tf-module-capella-sandbox.git//"

  cloud_provider      = "aws"
  organization_id     = var.organization_id
  project_name        = "Demo 1 Project"
  project_description = "My Capella sandbox project"
  region              = "eu-north-1"

  cluster_name                      = "singel_node_cluster"
  cluster_cidr_range                = "10.0.4.0/23"
  cluster_allowed_access_cidr_range = [""] # Your CIDR range here.
  cluster_availability              = "single"
  cluster_service_support           = "basic"
  cluster_node_iops                 = 3000
  cluster_services                  = ["data", "query", "index", "search"]

  buckets_config = [
    {
      name                = "bucket1"
      db_user_permissions = "data_writer"
    },
    {
      name                = "bucket2"
      db_user_permissions = "data_reader"
    },
  ]

  bucket_sample_content_config = [
    {
      name                = "beer-sample"
      db_user_permissions = "data_writer"
    },
  ]

  cluster_schedule = [
    {
      day   = "monday"
      state = "custom"
      from  = { hour = 08, minute = 00 }
      to    = { hour = 17, minute = 0 }
    },
    {
      day   = "tuesday"
      state = "custom"
      from  = { hour = 08, minute = 00 }
      to    = { hour = 17, minute = 0 }
    },
    {
      day   = "wednesday"
      state = "custom"
      from  = { hour = 08, minute = 00 }
      to    = { hour = 17, minute = 0 }
    },
    {
      day   = "thursday"
      state = "custom"
      from  = { hour = 08, minute = 00 }
      to    = { hour = 17, minute = 0 }
    },
    {
      day   = "friday"
      state = "custom"
      from  = { hour = 08, minute = 00 }
      to    = { hour = 17, minute = 0 }
    },
    {
      day   = "saturday"
      state = "off"
    },
    {
      day   = "sunday"
      state = "off"
    }
  ]

  project_permissions_users = [
    {
      name               = "Demo User 1"
      email              = "user1@playgrounddata.io"
      organization_roles = ["organizationOwner"]
      project_roles      = ["projectDataReaderWriter"]
    },
    {
      name               = "Demo User 2"
      email              = "user2@playgrounddata.io"
      organization_roles = ["organizationMember"]
      project_roles      = ["projectViewer"]
    },
    {
      name               = "Demo User 3"
      email              = "user3@playgrounddata.io"
      organization_roles = ["projectCreator"]
      project_roles      = ["projectOwner"]
    }
  ]

}

```