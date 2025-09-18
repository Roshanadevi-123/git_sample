default_tags = {
  Application        = "autofest"                   # Application name
  Environment        = "Development"                # Must be from valid list: "Production", "Development", "Test", "Training", "UAT", "SIT", "DR", "POC".
  DataClassification = "Proprietary"                # This tag represents the classification of the Data that will reside in the resources. Accepted values are “Public”, “Proprietary”, “Confidential” and “Sensitive”.
  Costcenter         = "10000081"                   #* # A valid costcenter that belongs to the division
  Division           = "IT"                         #* Must be from valid list: AH, HH, MMD, MRL, TIOE, CTO Org, Ent IT , ITRMS.
  Consumer           = "gin-autofest-dev@merck.com" # Values in all environments must end in "@merck.com".
  Service            = "autofest-Development"
}

######## Account Details #######
account_no                   = "254159895328"
admin_role                   = "autofest-deployment-role"
region                       = "us-east-1"
application                  = "autofest"
base_role                    = "aws-reserved/sso.amazonaws.com/AWSReservedSSO_standard-base-admin-role_ba7f315c40156552"
iam_role                     = "aws-reserved/sso.amazonaws.com/AWSReservedSSO_standard-iam-admin-role_d536bc2b2537ef9b" #*
app_name                     = "autofest"
cross-region-backup-required = "false"
environment                  = "dev"f
multi_region                 = false
vpc_id                       = "vpc-0ed766c9adcbcb44e"


resource_vars_rds_kms = {
  appname     = "autofest"
  region      = "useast1"
  attributes  = ["rds", "kms", "001"]
  label_order = []
  environment = "dev"
}

resource_vars_s3_kms = {
  appname     = "autofest"
  region      = "useast1"
  attributes  = ["s3", "kms", "001"]
  label_order = []
  environment = "dev"
}


resource_vars_ec2_kms = {
  appname     = "autofest"
  region      = "useast1"
  attributes  = ["ec2", "kms", "001"]
  label_order = []
  environment = "dev"
}

resource_vars_s3 = {
  appname     = "autofest"
  region      = "useast1"
  attributes  = ["rds", "s3", "001"]
  label_order = []
  environment = "dev"
}

resource_vars_asg = {
  appname     = "autofest"
  region      = "useast1"
  attributes  = ["web", "001"]
  environment = "dev"
  label_order = []
}

resource_vars_alb = {
  appname     = "autofest"
  region      = "useast1"
  attributes  = ["alb", "001"]
  environment = "dev"
  label_order = []
}

resource_vars_alb_s3 = {
  appname     = "autofest"
  region      = "useast1"
  attributes  = ["alb", "s3", "001"]
  environment = "dev"
  label_order = []
}

rds_db_creds = "dev/oracle/rds"
backup_tags = {
  createdbyterraform              = "true"
  MCSManageTag-Backup             = "No",
  MCSManageTag-TargetBU           = "None_Prod_True"
  CoreInfraTag-Backup             = "Yes"
  CoreInfraTag-BackupCopyToBunker = "No"
  CoreInfraTag-BackupPolicy       = "None_Prod_Continuous"
}

####################
#RDS               #
####################
##########################
#RDS SUBNET GROUPS       #
##########################
#use_name_prefix      = false
subnet_ids           = ["subnet-0bcc4cb2bc4a6eebd", "subnet-01d777d3434e812f5"]
db_subnet_group_name = "autofest-useast1-dev-subnetgroup-001"


##########################
#RDS OPTION GROUPS       #
##########################
create                   = true
name                     = "autofest-useast1-dev-optiongroup-001"
use_name_prefix          = false
option_group_description = "Option Group for Oracle RDS"
engine_name              = "oracle-ee"
major_engine_version     = "19"
options = [
  {
    option_name = "S3_INTEGRATION"
  },
  {
    option_name = "JVM"
  },
  {
    option_name = "OLAP"
  },
  {
    option_name = "SPATIAL"
  },
  #{
  # option_name = "CATPROC"

  #},
  #{
  # option_name = "CATALOG"
  #},
  #{
  # option_name = "RAC"
  #},
  #{
  # option_name = "XDB"
  #},
  #{
  # option_name = "OWM"
  #},
  {
    option_name                    = "SSL"
    port                           = "2484"
    vpc_security_group_memberships = ["sg-07631306f95029946"]
    option_settings = [
      {
        name  = "SQLNET.SSL_VERSION"
        value = "1.2"
      },
      {
        name  = "SQLNET.CIPHER_SUITE"
        value = "SSL_RSA_WITH_AES_256_CBC_SHA"
      },
      {
        name  = "FIPS.SSLFIPS_140"
        value = "TRUE"
      }
    ]
  },
  {
    option_name = "Timezone"
    option_settings = [
      {
        name  = "TIME_ZONE"
        value = "UTC"
      }
    ]
  }
]
timeouts = {}


#############################
#RDS PARAMETER GROUPS       #
#############################
family                = "oracle-ee-19"
parameter_group_name  = "autofest-useast1-dev-parametergroup-001"
param_group_file_name = "autofest-db-parameters-dev-01.json"

####################
#RDS               #
####################
create_rds                            = true
create_monitoring_role                = false
monitoring_interval                   = 0
monitoring_role_arn                   = ""
monitoring_role_use_name_prefix       = false
monitoring_role_name                  = null
use_identifier_prefix                 = false
identifier                            = "autofest-useast1-dev-oracle-db-001"
availability_zone                     = "us-east-1a"
license_model                         = "bring-your-own-license"
engine                                = "oracle-ee"
engine_version                        = "19.0.0.0.ru-2024-01.rur-2024-01.r1"
vpc_security_group_ids                = ["sg-02a090bc86fb6e161", "sg-07631306f95029946"]
allocated_storage                     = "100"
instance_class                        = "db.m5.large"
db_name                               = "AUTFESD2"
max_allocated_storage                 = "250"
storage_type                          = "gp2"
storage_encrypted                     = true
port                                  = "25881" #*
multi_az                              = false
subnet_ids_rds                        = ["subnet-0bcc4cb2bc4a6eebd", "subnet-01d777d3434e812f5"] #*
db_subnet_group_name_rds              = "autofest-useast1-dev-subnetgroup-001"
parameter_group_name_rds              = "autofest-useast1-dev-parametergroup-001"
option_group_name                     = "autofest-useast1-dev-optiongroup-001"
kms_key_id                            = "" #*
iam_database_authentication_enabled   = false
enabled_cloudwatch_logs_exports       = ["listener", "trace", "audit"] #*
deletion_protection                   = true
auto_minor_version_upgrade            = true
allow_major_version_upgrade           = false
maintenance_window                    = "Sun:00:00-Sun:01:00"
backup_window                         = ""
backup_retention_period               = 7
delete_automated_backups              = false
final_snapshot_identifier_prefix      = "final"
snapshot_identifier                   = ""
copy_tags_to_snapshot                 = true
skip_final_snapshot                   = false
performance_insights_enabled          = true
performance_insights_retention_period = 7
performance_insights_kms_key_id       = ""
character_set_name                    = "AL32UTF8"
timezone                              = ""
replicate_source_db                   = null
replica_mode                          = null
domain                                = null
domain_iam_role_name                  = null
network_type                          = null
iops                                  = null
publicly_accessible                   = false
ca_cert_identifier                    = null
apply_immediately                     = true
timeouts_rds = {
  create = "10h"
  update = "10h"
  delete = "10h"

}

####### S3 BUCKET ##############

s3_integration_role_required = true
bucket_name                  = "autofest-useast1-dev-rds-s3-001"

buckets_requested  = ["autofest-useast1-dev-rds-s3-001"]
kms_source_key_id  = ""        #leave blank to have a KMS key created for you, use "NULL" if sse_algorithm is AES256
kms_replica_key_id = ""        #leave blank to have a KMS key created for you, use "NULL" if sse_algorithm is AES256
sse_algorithm      = "aws:kms" #valid options are AES256 or aws:kms, defaults to aws:kms if blank, applies to source and replica buckets
attach_policy      = true
s3_bucket_versioning = {
  status     = "Enabled" #enabled is required if requesting a replica bucket
  mfa_delete = "Disabled"
}
create_replica_bucket         = false #a replica bucket will be created for each source bucket requested above
force_destroy                 = false
website                       = {}
s3_bucket_cors_rule           = []
s3_bucket_lifecycle_rule      = []
s3_bucket_intelligent_tiering = []

###### ALB Bucket #############

alb_kms_source_key_id = null
alb_s3_sse_algorithm  = "AES256"


############# AUTO SCALING GROUP ##############

# min_size                  = 1
# max_size                  = 1
# desired_capacity          = 1
# wait_for_capacity_timeout = 0
# health_check_type         = "EC2"
# security_groups           = ["sg-02a090bc86fb6e161"]                                   #*
# iam_instance_profile_arn  = "arn:aws:iam::254159895328:instance-profile/instance-role" #"arn:aws:iam::382146222821:instance-profile/instance-role" #*
# vpc_zone_identifier       = ["subnet-0bcc4cb2bc4a6eebd"]                               #*
# user_data_file_name       = "userdata-dev.txt"
# image_id                  = "ami-0841db5b1937d0a15"
# instance_type             = "m5.large"
# egress_cidr_blocks        = "0.0.0.0/0"

# update_default_version = true

# capacity_reservation_specification = {
#   capacity_reservation_preference = "open"
# }
# cpu_options = {
#   core_count       = 1
#   threads_per_core = 1
# }
# credit_specification = {
#   cpu_credits = "standard"
# }
# placement = {
#   availability_zone = "us-east-1a"
# }

# http_endpoint        = "enabled"
# key_name             = "autofest-dev-key"
# instance_name        = "autofest-useast1-dev-ec2-001"
# launch_template_name = "autofest-useast1-dev-asg-lt-001"
# # network_interfaces = [ 
# #  private_ip-address = "10.255.38.10"
#  #]






############ ALB tfvars ##################

internal        = true
certificate_arn = "arn:aws:acm:us-east-1:254159895328:certificate/383609ff-850f-4d2e-beb8-e7b5461a70ff"
tg_name         = "autofest-useast1-dev-alb-tg-001"
############### EC2 Server ################
ami = "ami-0841db5b1937d0a15"
# name_ec2             = "autofest-useast1-dev-web-01"
instance_type               = "m5.large"
ec2_availability_zone       = "us-east-1a"
subnet_id                   = "subnet-034a2bc4ddfa99975"
vpc_security_group_ids_ec2  = ["sg-02a090bc86fb6e161", "sg-052a5daa3ca873baf"]
key_pair_name               = "autofest-dev-key"
iam_instance_profile        = "instance-role"
availability_zone1          = "us-east-1a"
user_data_replace_on_change = false
user_data_file_name         = "userdata-dev.txt"
# user_data_file_name1 = "scheduler-userdata-test.txt"
enable_volume_tags            = false #conflicts with root_block_device
root_block_device_volume_size = 120
root_block_device             = null
ebs_block_device              = null
create_iam_instance_profile   = false
metadata_options = {
  http_tokens = "required"
}

ebs_volumes = [
  {
    device_name = "/dev/sdf"
    volume_size = 120
    volume_type = "gp3"
    kms_key_id  = ""
    throughput  = 200
  }

]

CoreInfraTag-BackupPolicy = "None_Prod"
cpu_options               = null
prefix_list_ids_ec2win    = ["pl-0db70414a8c30e5e9"]

