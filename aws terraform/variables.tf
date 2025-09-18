# Variables
variable "default_tags" {
  type        = map(string)
  description = "map of mandatory tags"
}
####################### Account details ############################
variable "account_no" {
  type        = string
  description = "aws account number"
}
variable "admin_role" {
  type        = string
  description = "Role arn that is used to run tf code"
}
variable "base_role" {
  type        = string
  description = "ec2 compute role arn that is used to run tf code"
}
variable "region" {
  type        = string
  description = "Name of region"
}
variable "environment" {
  type        = string
  description = "Name of environment"
}
variable "multi_region" {
  type        = string
  description = "Name of multi-region"
}
# variable "application" {

# }
# variable "iam_role" {

# }
# variable "s3_integration_role_required" {

# }
# variable "cross-region-backup-required" {

# }
# variable "bucket_name" {

# }
# variable "egress_cidr_blocks" {

# }
# variable "buckets_requested" {

# }
# variable "app_name" {

# }
####################
#RDS               #
####################
##########################
#RDS SUBNET GROUPS       #
##########################
variable "use_name_prefix" {
  description = "Determines whether to use `name` as is or create a unique name beginning with `name` as the specified prefix"
  type        = bool
  default     = true
}
variable "db_subnet_group_name" {
  type        = string
  description = "name of existing subnet group if not creating new one"
}
variable "subnet_ids" {
  type        = list(string)
  description = "list of subnets"
}


##########################
#RDS OPTION GROUPS       #
##########################
variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the option group"
  type        = string
  default     = ""
}



variable "option_group_description" {
  description = "The description of the option group"
  type        = string
  default     = null
}

variable "engine_name" {
  description = "Specifies the name of the engine that this option group should be associated with"
  type        = string
  default     = null
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
  default     = null
}

variable "options" {
  description = "A list of Options to apply"
  type        = any
  default     = []
}

variable "timeouts" {
  description = "Define maximum timeout for deletion of `aws_db_option_group` resource"
  type        = map(string)
  default     = {}
}


#############################
#RDS PARAMETER GROUPS       #
#############################
variable "parameter_group_name" {
  type        = string
  default     = ""
  description = "name of existing parameter group if not creating new one"
}

variable "family" {
  type        = string
  default     = ""
  description = "parameter family"
}

variable "param_group_file_name" {
  type        = string
  description = "file name where parameters are stored in for parameter group"
}

####################
#RDS               #
####################
variable "create_rds" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "use_identifier_prefix" {
  description = "Determines whether to use `identifier` as is or create a unique identifier beginning with `identifier` as the specified prefix"
  type        = bool
  default     = false
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
  default     = null
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp3' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp3'."
  type        = string
  default     = "gp3"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}
#unused
# variable "kms_key_id" {
#   description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
#   type        = string
#   default     = null
# }

variable "replicate_source_db" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate."
  type        = string
  default     = null
}

variable "license_model" {
  description = "License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1"
  type        = string
  default     = null
}

variable "replica_mode" {
  description = "Specifies whether the replica is in either mounted or open-read-only mode. This attribute is only supported by Oracle instances. Oracle replicas operate in open-read-only mode unless otherwise specified"
  type        = string
  default     = null
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  type        = bool
  default     = true
}

variable "domain" {
  description = "The ID of the Directory Service Active Directory domain to create the instance in"
  type        = string
  default     = null
}

variable "domain_iam_role_name" {
  description = "(Required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service"
  type        = string
  default     = null
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = null
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = null
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = null
}

variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = null
}
#unused
# variable "username" {
#   description = "Username for the master DB user"
#   type        = string
#   default     = null
# }
#unused
# variable "password" {
#   description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
#   type        = string
#   default     = null
# }

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = false
}

variable "snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  type        = string
  default     = null
}

variable "copy_tags_to_snapshot" {
  description = "On delete, copy all Instance tags to the final snapshot"
  type        = bool
  default     = false
}

variable "final_snapshot_identifier_prefix" {
  description = "The name which is prefixed to the final snapshot on cluster destroy"
  type        = string
  default     = "final"
}

# variable "vpc_security_group_ids" {
#   description = "List of VPC security groups to associate"
#   type        = list(string)
#   default     = []
# }

variable "db_subnet_group_name_rds" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  type        = string
  default     = ""
}

variable "parameter_group_name_rds" {
  description = "Name of the DB parameter group to associate"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "The Availability Zone of the RDS instance"
  type        = string
  default     = null
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  type        = number
  default     = 0
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  type        = number
  default     = 0
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero."
  type        = string
  default     = null
}

variable "monitoring_role_name" {
  description = "Name of the IAM role which will be created when create_monitoring_role is enabled."
  type        = string
  default     = "rds-monitoring-role"
}

variable "monitoring_role_use_name_prefix" {
  description = "Determines whether to use `monitoring_role_name` as is or create a unique identifier beginning with `monitoring_role_name` as the specified prefix"
  type        = bool
  default     = false
}

# variable "monitoring_role_description" {
#   description = "Description of the monitoring IAM role"
#   type        = string
#   default     = null
# }

variable "create_monitoring_role" {
  description = "Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
  type        = bool
  default     = false
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = null
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type        = string
  default     = null
}

# variable "tags" {
#   description = "A mapping of tags to assign to all resources"
#   type        = map(string)
#   default     = {}
# }

variable "option_group_name" {
  description = "Name of the DB option group to associate."
  type        = string
  default     = null
}

variable "timezone" {
  description = "Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information."
  type        = string
  default     = null
}

variable "character_set_name" {
  description = "The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS and Collations and Character Sets for Microsoft SQL Server for more information. This can only be set on creation."
  type        = string
  default     = null
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
  type        = list(string)
  default     = []
}

variable "timeouts_rds" {
  description = "Updated Terraform resource management timeouts. Applies to `aws_db_instance` in particular to permit resource management times"
  type        = map(string)
  default     = {}
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}

variable "performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled"
  type        = bool
  default     = true
}

variable "performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years)."
  type        = number
  default     = 7
}
#unused
# variable "performance_insights_kms_key_id" {
#   description = "The ARN for the KMS key to encrypt Performance Insights data."
#   type        = string
#   default     = null
# }

variable "max_allocated_storage" {
  description = "Specifies the value for Storage Autoscaling"
  type        = number
  default     = 0
}

variable "ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  type        = string
  default     = null
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
  default     = true
}
#unused
# variable "s3_import" {
#   description = "Restore from a Percona Xtrabackup in S3 (only MySQL is supported)"
#   type        = map(string)
#   default     = null
# }

#unused
# variable "restore_to_point_in_time" {
#   description = "Restore to a point in time (MySQL is NOT supported)"
#   type        = map(string)
#   default     = null
# }

variable "network_type" {
  description = "The type of network stack"
  type        = string
  default     = null
}

################################################################################
# CloudWatch Log Group
################################################################################

# variable "create_cloudwatch_log_group" {
#   description = "Determines whether a CloudWatch log group is created for each `enabled_cloudwatch_logs_exports`"
#   type        = bool
#   default     = false
# }

# variable "cloudwatch_log_group_retention_in_days" {
#   description = "The number of days to retain CloudWatch logs for the DB instance"
#   type        = number
#   default     = 7
# }

# variable "cloudwatch_log_group_kms_key_id" {
#   description = "The ARN of the KMS Key to use when encrypting log data"
#   type        = string
#   default     = null
# }
#unused
# variable "subnet_ids_rds" {
#   description = "A list of VPC subnet IDs"
#   type        = list(string)
#   default     = []
# }

# variable "db_subnet_name" {
#   description = "The name of the DB subnet group"
#   type        = string
#   default     = "db_subnet_group"
# }


variable "rds_db_creds" {
  type = string

}

variable "backup_tags" {
  type        = map(string)
  description = "Map of mandatory tags to be attached on resources"
}


############# S3 VARIABLES #################

### S3 Bucket Variables ###

variable "attach_policy" {
  description = "Controls if S3 bucket should have bucket policy attached (set to `true` to use value of `policy` as bucket policy)"
  type        = bool
  default     = false
}
variable "website" {
  description = "Map containing static web-site hosting or redirect configuration."
  type        = any # map(string)
  default     = {}
}
variable "s3_bucket_versioning" {
  description = "Map containing versioning configuration. Use terraform.auto.tfvars file"
  type        = map(string)
  default = {
    status     = "enabled"
    mfa_delete = "disabled"
  }
}
variable "s3_bucket_cors_rule" {
  description = "List of maps containing rules for Cross-Origin Resource Sharing."
  type        = any
  default     = []
}
variable "s3_bucket_lifecycle_rule" {
  description = "List of maps containing configuration of object lifecycle management."
  type        = any
  default     = []
}
variable "s3_bucket_intelligent_tiering" {
  description = "Map containing intelligent tiering configuration."
  type        = any
  default     = {}
}
#unused
# variable "create_replica_bucket" {
#   description = "Controls if a replica bucket should be created"
#   type        = bool
#   default     = false
# }

variable "force_destroy" {
  description = "(Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = false
}

variable "kms_source_key_id" {
  description = "KMS Key for S3"
  type        = string
  default     = null
}

variable "alb_kms_source_key_id" {
  description = "KMS Key for S3"
  type        = string
  default     = null
}
#unused
# variable "kms_replica_key_id" {
#   description = "KMS Key for S3"
#   type        = string
#   default     = null
# }

variable "sse_algorithm" {
  description = "KMS Key for S3"
  type        = string
  default     = "aws_kms"
}

variable "alb_s3_sse_algorithm" {
  description = "KMS Key for S3"
  type        = string
  default     = "aws_kms"
}

#KMS Resource Variables

variable "resource_vars_rds_kms" {
  description = "map of tags to pass to labels module"
  type = object({
    appname     = string
    region      = string
    attributes  = list(string)
    label_order = list(string)
  })
}

variable "resource_vars_s3_kms" {
  description = "map of tags to pass to labels module"
  type = object({
    appname     = string
    region      = string
    attributes  = list(string)
    label_order = list(string)
  })
}

variable "resource_vars_ec2_kms" {
  description = "map of tags to pass to labels module"
  type = object({
    appname     = string
    region      = string
    attributes  = list(string)
    label_order = list(string)
  })
}

variable "resource_vars_s3" {
  description = "map of tags to pass to labels module"
  type = object({
    appname     = string
    region      = string
    attributes  = list(string)
    label_order = list(string)
  })
}

variable "resource_vars_asg" {
  description = "map of tags to pass to labels module"
  type = object({
    appname     = string
    region      = string
    attributes  = list(string)
    label_order = list(string)
  })
}

variable "resource_vars_alb" {
  description = "map of tags to pass to labels module"
  type = object({
    appname     = string
    region      = string
    attributes  = list(string)
    label_order = list(string)
  })
}

variable "resource_vars_alb_s3" {
  description = "map of tags to pass to labels module"
  type = object({
    appname     = string
    region      = string
    attributes  = list(string)
    label_order = list(string)
  })
}
################################################################################
# Autoscaling group
################################################################################

# variable "http_endpoint" {
#   description = "Customize the metadata options of the instance"
#   type        = string
#   default     = "enabled"
# }

# variable "min_size" {
#   description = "The minimum size of the autoscaling group"
#   type        = number
#   default     = null
# }

# variable "max_size" {
#   description = "The maximum size of the autoscaling group"
#   type        = number
#   default     = null
# }

# variable "desired_capacity" {
#   description = "The number of Amazon EC2 instances that should be running in the autoscaling group"
#   type        = number
#   default     = null
# }

# variable "wait_for_capacity_timeout" {
#   description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior."
#   type        = string
#   default     = null
# }

# variable "health_check_type" {
#   description = "`EC2` or `ELB`. Controls how health checking is done"
#   type        = string
#   default     = null
# }

# variable "vpc_zone_identifier" {
#   description = "A list of subnet IDs to launch resources in. Subnets automatically determine which availability zones the group will reside. Conflicts with `availability_zones`"
#   type        = list(string)
#   default     = null
# }


################################################################################
# Launch template
################################################################################

# variable "image_id" {
#   description = "The AMI from which to launch the instance"
#   type        = string
#   default     = ""
# }

# variable "instance_type" {
#   description = "The type of the instance. If present then `instance_requirements` cannot be present"
#   type        = string
#   default     = null
# }

# variable "update_default_version" {
#   description = "Whether to update Default Version each update. Conflicts with `default_version`"
#   type        = string
#   default     = null
# }

# variable "capacity_reservation_specification" {
#   description = "Targeting for EC2 capacity reservations"
#   type        = any
#   default     = {}
# }

# variable "cpu_options" {
#   description = "The CPU options for the instance"
#   type        = map(string)
#   default     = {}
# }

# variable "credit_specification" {
#   description = "Customize the credit specification of the instance"
#   type        = map(string)
#   default     = {}
# }

# variable "placement" {
#   description = "The placement of the instance"
#   type        = map(string)
#   default     = {}
# }

# # variable "block_device_mappings" {
# #   description = "Specify volumes to attach to the instance besides the volumes specified by the AMI"
# #   type = list(object({
# #     device_name = optional(string, null)
# #     no_device   = optional(string, null)
# #     ebs         = optional(list(any), [])
# #   }))
# #   default = []
# # }

# variable "iam_instance_profile_arn" {
#   description = "ARN of instance profile"
#   type        = string
#   default     = null
# }
# # variable "load_balancers" {
# #   description = "A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers. For ALBs, use `target_group_arns` instead"
# #   type        = list(string)
# #   default     = []
# # }

# # variable "target_group_arns" {
# #   description = "A set of `aws_alb_target_group` ARNs, for use with Application or Network Load Balancing"
# #   type        = list(string)
# #   default     = []
# # }

variable "user_data_file_name" {
  default     = null
  type        = string
  description = "Name of userdata file"
}
# variable "key_name" {
#   description = "The key name that should be used for the instance"
#   type        = string
#   default     = null
# }

# variable "instance_name" {
#   description = "The insatnce name that should be used for the instance"
#   type        = string
#   default     = null

# }

# variable "launch_template_name" {
#   description = "The key name that should be used for the instance"
#   type        = string
#   default     = null
# }


# variable "network_interfaces" {
#   description = "Customize network interfaces to be attached at instance boot time"
#   type        = list(any)
#   default     = []
# }

######### ALB Vars #####################

variable "vpc_id" {
  type        = string
  description = "VPC id"
}
variable "security_groups" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []

}
variable "internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
  default     = false
}

variable "certificate_arn" {
  description = "A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate_arn. Optional key/values: ssl_policy (defaults to ELBSecurityPolicy-2016-08), target_group_index (defaults to https_listeners[count.index])"
  type        = any
  default     = []
}
variable "tg_name" {
  type        = string
  description = "target group name"

}
# variable "target_id" {

# }
################# EC2 SERVER ################
variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = null
}

# variable "name_ec2" {
#   description = "ID of AMI to use for the instance"
#   type        = string
#   default     = null
# }

variable "ec2_availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}

# variable "ebs_volumes" {
#   description = "Configuration parameters for EBS block device/s"
#   type = list(object({
#     device_name = string, # Name of EBS device
#     volume_size = number, # Size of additional EBS block devices to attach to the instance
#     volume_type = string, # Type of additional EBS block devices to attach to the instance
#     kms_key_id  = string, # EBS block devices to attach to the instance
#     throughput  = number  # Additional EBS block devices to attach to the instance
#   }))
#   default = [{
#     device_name = "/dev/sdf"
#     kms_key_id  = null
#     throughput  = 200
#     volume_size = 5
#     volume_type = "gp3"
#   }]
# }

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t5.micro"
}
# variable "resource_vars_ec2_kms" {
#   description = "map of tags to pass to labels module"
#   type = object({
#     appname     = string
#     region      = string
#     attributes  = list(string)
#     label_order = list(string)
#   })
# }

variable "key_pair_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = null
}
#unused
# variable "root_block_device_volume_size" {
#   description = "Customize details about the root block device of the instance"
#   type        = string
#   default     = 50

# }

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}

variable "user_data_replace_on_change" {
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true. Defaults to false if not set."
  type        = bool
  default     = false
}


variable "enable_volume_tags" {
  description = "Whether to enable volume tags (if enabled it conflicts with root_block_device tags)"
  type        = bool
  default     = true
}

#unused
# variable "iam_role_policies" {
#   description = "Policies attached to the IAM role"
#   type        = map(string)
#   default     = {}
# }
#unused
# variable "iam_role_name" {
#   description = "Name to use on IAM role created"
#   type        = string
#   default     = null
# }
#unused
# variable "iam_role_description" {
#   description = "Description of the role"
#   type        = string
#   default     = null
# }
#unused
# variable "iam_role_tags" {
#   description = "A map of additional tags to add to the IAM role/profile created"
#   type        = map(string)
#   default     = {}
# }

# variable "user_data_file_name" {}
# variable "user_data_file_name1" {}
#unused
# variable "root_block_device" {
#   default = null
# }

# variable "ebs_block_device" {}
# # variable "cpu_options" {

# }
variable "metadata_options" {
  type    = map(string)
  default = null
}
variable "CoreInfraTag-BackupPolicy" {
  default = null
  type    = string
}

# variable "sgwin_resource_vars" {
#   description = "map of tags to pass to labels module"
#   type = object({
#     appname     = string
#     region      = string
#     attributes  = list(string)
#     label_order = list(string)
#   })
# }
#unused
# variable "prefix_list_ids_ec2win" {
#   type        = list(string)
#   description = "Prefix list ID to use in security group"
#   default     = null
# }


######  DR  VAR ###########################
variable "rds_dr" {
  type        = bool
  description = "Environment Details"
  default     = false
}
variable "rds_dr_region" {
  type        = string
  default     = "us-east-2"
  description = "region name like us-east-1 for naming of resources"
}

variable "kmsdr_appname" {
  type        = string
  default     = ""
  description = "Environment Details"
}

variable "kmsdr_multi_region" {
  type        = string
  default     = ""
  description = "Environment Details"
}
variable "kmsdr_enabled" {
  type        = bool
  default     = false
  description = "Environment Details"
}
variable "kmsdr_rotation_enabled" {
  type        = bool
  default     = false
  description = "Environment Details"
}
variable "kmsdr_customer_master_key_spec" {
  type        = string
  default     = ""
  description = "Environment Details"
}
variable "kmsdr_key_usage" {
  type        = string
  default     = ""
  description = "Environment Details"
}
variable "kmsdr_kms_alias" {
  type        = string
  default     = ""
  description = "Environment Details"
}
variable "kmsdr_deletion_window_in_days" {
  type        = number
  default     = null
  description = "Environment Details"
}
variable "kmsdr_attributes" {
  type        = list(string)
  default     = null
  description = "Environment Details"
}
variable "kmsdr_description" {
  type        = string
  default     = ""
  description = "Environment Details"
}
variable "prefix" {
  type        = string
  default     = ""
  description = "prefix details"
}
# variable "env" {
#   type        = string
#   default     = ""
#   description = "environment"
# }
variable "labels_region" {
  type        = string
  default     = ""
  description = "region name like useast1 for naming of resources"
}
