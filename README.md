# tf-module-capella-sandbox
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_couchbase-capella"></a> [couchbase-capella](#requirement\_couchbase-capella) | 0.2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_couchbase-capella"></a> [couchbase-capella](#provider\_couchbase-capella) | 0.2.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [couchbase-capella_allowlist.default_allow_list](https://registry.terraform.io/providers/couchbasecloud/couchbase-capella/0.2.2/docs/resources/allowlist) | resource |
| [couchbase-capella_bucket.custom_bucket](https://registry.terraform.io/providers/couchbasecloud/couchbase-capella/0.2.2/docs/resources/bucket) | resource |
| [couchbase-capella_cluster.default_cluster](https://registry.terraform.io/providers/couchbasecloud/couchbase-capella/0.2.2/docs/resources/cluster) | resource |
| [couchbase-capella_cluster_onoff_schedule.default_schedule](https://registry.terraform.io/providers/couchbasecloud/couchbase-capella/0.2.2/docs/resources/cluster_onoff_schedule) | resource |
| [couchbase-capella_database_credential.custom_db_user](https://registry.terraform.io/providers/couchbasecloud/couchbase-capella/0.2.2/docs/resources/database_credential) | resource |
| [couchbase-capella_database_credential.sample_db_user](https://registry.terraform.io/providers/couchbasecloud/couchbase-capella/0.2.2/docs/resources/database_credential) | resource |
| [couchbase-capella_project.default_project](https://registry.terraform.io/providers/couchbasecloud/couchbase-capella/0.2.2/docs/resources/project) | resource |
| [couchbase-capella_sample_bucket.sample_bucket](https://registry.terraform.io/providers/couchbasecloud/couchbase-capella/0.2.2/docs/resources/sample_bucket) | resource |
| [couchbase-capella_user.default_users](https://registry.terraform.io/providers/couchbasecloud/couchbase-capella/0.2.2/docs/resources/user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_sample_content"></a> [bucket\_sample\_content](#input\_bucket\_sample\_content) | Specifies the sample content to be used in the bucket. Options include travel-sample, beer-sample, or gamesim-sample. | `list(string)` | <pre>[<br>  "travel-sample"<br>]</pre> | no |
| <a name="input_buckets_config"></a> [buckets\_config](#input\_buckets\_config) | A list of bucket configurations. | <pre>list(object({<br>    name                       = string<br>    type                       = optional(string)<br>    storage_backend            = optional(string)<br>    memory_allocation_in_mb    = optional(number)<br>    bucket_conflict_resolution = optional(string)<br>    durability_level           = optional(string)<br>    replicas                   = optional(number)<br>    flush                      = optional(bool)<br>    time_to_live_in_seconds    = optional(number)<br>    eviction_policy            = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | The cloud provider where the infrastructure is to be deployed. Default is AWS. | `string` | `"aws"` | no |
| <a name="input_cluster_allowed_access_cidr_range"></a> [cluster\_allowed\_access\_cidr\_range](#input\_cluster\_allowed\_access\_cidr\_range) | A list of CIDR ranges that are allowed to access the cluster. | `list(string)` | `[]` | no |
| <a name="input_cluster_availability"></a> [cluster\_availability](#input\_cluster\_availability) | Defines the availability of the cluster. Options include single and multi. | `string` | `"single"` | no |
| <a name="input_cluster_cidr_range"></a> [cluster\_cidr\_range](#input\_cluster\_cidr\_range) | The CIDR range for the cluster's network. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster. | `string` | n/a | yes |
| <a name="input_cluster_node_cpu"></a> [cluster\_node\_cpu](#input\_cluster\_node\_cpu) | The number of CPU cores allocated per cluster node. | `number` | `4` | no |
| <a name="input_cluster_node_disk_size"></a> [cluster\_node\_disk\_size](#input\_cluster\_node\_disk\_size) | The size of the disk, in GB. | `number` | `50` | no |
| <a name="input_cluster_node_disk_type"></a> [cluster\_node\_disk\_type](#input\_cluster\_node\_disk\_type) | The type of disk used for cluster nodes. Options include gp3 and io2. | `string` | `"gp3"` | no |
| <a name="input_cluster_node_iops"></a> [cluster\_node\_iops](#input\_cluster\_node\_iops) | The IOPS for the disks used by cluster nodes. | `number` | `3000` | no |
| <a name="input_cluster_node_ram"></a> [cluster\_node\_ram](#input\_cluster\_node\_ram) | The amount of RAM, in GB. | `number` | `16` | no |
| <a name="input_cluster_nodes"></a> [cluster\_nodes](#input\_cluster\_nodes) | The number of nodes in the cluster. | `number` | `3` | no |
| <a name="input_cluster_schedule"></a> [cluster\_schedule](#input\_cluster\_schedule) | A list of scheduling configurations for each day of the week, specifying operational hours. | <pre>list(object({<br>    day   = string<br>    state = string<br>    from = optional(object({<br>      hour   = number<br>      minute = number<br>    }))<br>    to = optional(object({<br>      hour   = number<br>      minute = number<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_cluster_scheduling_enabled"></a> [cluster\_scheduling\_enabled](#input\_cluster\_scheduling\_enabled) | Enable or disable scheduling for the cluster. | `bool` | `false` | no |
| <a name="input_cluster_service_support"></a> [cluster\_service\_support](#input\_cluster\_service\_support) | The level of service support for the cluster. Options are basic, developer pro and enterprise. | `string` | `"basic"` | no |
| <a name="input_cluster_service_support_timezone"></a> [cluster\_service\_support\_timezone](#input\_cluster\_service\_support\_timezone) | The timezone for the cluster service support. Options are ET, GMT, IST or PT. | `string` | `"PT"` | no |
| <a name="input_cluster_services"></a> [cluster\_services](#input\_cluster\_services) | A list of services enabled for the cluster. Options are data, query, index, search, analytics and eventing. | `list(string)` | <pre>[<br>  "data",<br>  "query",<br>  "index",<br>  "search"<br>]</pre> | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | The Capella Organization ID for identifying the organization. | `string` | n/a | yes |
| <a name="input_project_description"></a> [project\_description](#input\_project\_description) | A brief description of the project. | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project. | `string` | n/a | yes |
| <a name="input_project_permissions_users"></a> [project\_permissions\_users](#input\_project\_permissions\_users) | A list of users with their project permissions, including names, emails, and assigned roles. | <pre>list(object({<br>    name  = string<br>    email = string<br>    roles = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the infrastructure is to be deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_allowed_access_cidr_ranges"></a> [cluster\_allowed\_access\_cidr\_ranges](#output\_cluster\_allowed\_access\_cidr\_ranges) | The allowed IPs for the Couchbase Capella cluster. |
| <a name="output_cluster_configuration"></a> [cluster\_configuration](#output\_cluster\_configuration) | The configuration of the Couchbase Capella cluster. |
| <a name="output_cluster_onoff_schedule_configuration"></a> [cluster\_onoff\_schedule\_configuration](#output\_cluster\_onoff\_schedule\_configuration) | The configuration of the Couchbase Capella cluster on/off schedule. |
| <a name="output_custom_buckets_configuration"></a> [custom\_buckets\_configuration](#output\_custom\_buckets\_configuration) | The configuration of the custom buckets. |
| <a name="output_db_user_credentials_custom_buckets"></a> [db\_user\_credentials\_custom\_buckets](#output\_db\_user\_credentials\_custom\_buckets) | The details of database user credentials for custom buckets. |
| <a name="output_db_user_credentials_sample_buckets"></a> [db\_user\_credentials\_sample\_buckets](#output\_db\_user\_credentials\_sample\_buckets) | The details of database user credentials for sample buckets. |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The ID of the Couchbase Capella project. |
| <a name="output_project_permissions_users"></a> [project\_permissions\_users](#output\_project\_permissions\_users) | The user details with permissions on the Couchbase Capella project. |
| <a name="output_sample_buckets_configuration"></a> [sample\_buckets\_configuration](#output\_sample\_buckets\_configuration) | The configuration of the sample buckets. |
<!-- END_TF_DOCS -->