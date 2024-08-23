variable "bucket_sample_content_config" {
  description = "Specifies the sample content to be used in the bucket. Options include travel-sample, beer-sample, or gamesim-sample."
  type = list(object({
    name                = string
    db_user_permissions = optional(string, "data_writer")
  }))
  default = []
}

variable "buckets_config" {
  description = "A list of bucket configurations."
  type = list(object({
    name                       = string
    type                       = optional(string)
    storage_backend            = optional(string)
    memory_allocation_in_mb    = optional(number)
    bucket_conflict_resolution = optional(string)
    durability_level           = optional(string)
    replicas                   = optional(number)
    flush                      = optional(bool)
    time_to_live_in_seconds    = optional(number)
    eviction_policy            = optional(string)
    db_user_permissions        = optional(string)
  }))
  default = []
}

variable "cluster_allowed_access_cidr_range" {
  description = "A list of CIDR ranges that are allowed to access the cluster."
  type        = list(string)
  default     = []
}

variable "cluster_availability" {
  description = "Defines the availability of the cluster. Options include single and multi."
  type        = string
  default     = "single"
}

variable "cluster_cidr_range" {
  description = "The CIDR range for the cluster's network."
  type        = string
  default     = "10.0.4.0/23"
}

variable "cluster_name" {
  description = "The name of the cluster."
  type        = string
}

variable "cluster_node_cpu" {
  description = "The number of CPU cores allocated per cluster node."
  type        = number
  default     = 4
}

variable "cluster_node_disk_size" {
  description = "The size of the disk, in GB."
  type        = number
  default     = 50
}

variable "cluster_node_disk_type" {
  description = "The type of disk used for cluster nodes. Options include gp3 and io2."
  default     = "gp3"
}

variable "cluster_node_iops" {
  description = "The IOPS for the disks used by cluster nodes."
  type        = number
  default     = 3000
}

variable "cluster_node_ram" {
  description = "The amount of RAM, in GB."
  type        = number
  default     = 16
}

variable "cluster_nodes" {
  description = "The number of nodes in the cluster."
  type        = number
  default     = 3
}

variable "cluster_schedule" {
  description = "A list of scheduling configurations for each day of the week, specifying operational hours."
  type = list(object({
    day   = string
    state = string
    from = optional(object({
      hour   = number
      minute = number
    }))
    to = optional(object({
      hour   = number
      minute = number
    }))
  }))
  default = []
}

variable "cluster_scheduling_enabled" {
  description = "Enable or disable scheduling for the cluster."
  type        = bool
  default     = false
}

variable "cluster_service_support" {
  description = "The level of service support for the cluster. Options are basic, developer pro and enterprise."
  type        = string
  default     = "basic"
}

variable "cluster_service_support_timezone" {
  description = "The timezone for the cluster service support."
  type        = string
  default     = "PT"
}

variable "cluster_services" {
  description = "A list of services enabled for the cluster. Options are data, query, index, search, analytics and eventing."
  type        = list(string)
  default     = ["data", "query", "index", "search"]
}

variable "organization_id" {
  description = "The Capella Organization ID for identifying the organization."
  type        = string
}

variable "project_description" {
  description = "A brief description of the project."
  type        = string
  default     = ""
}

variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "project_permissions_users" {
  description = "A list of users with their project permissions, including names, emails, and assigned roles."
  type = list(object({
    name               = string
    email              = string
    organization_roles = list(string)
    project_roles      = list(string)
  }))
  default = []
}

variable "region" {
  description = "The region where the infrastructure is to be deployed."
  type        = string
}
