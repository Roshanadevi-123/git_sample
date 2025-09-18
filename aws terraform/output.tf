# Outputs
output "rds_id" {
  value = module.rds_instance.db_instance_id
}
output "rds_name" {
  value = module.rds_instance.db_instance_name
}

output "IAM_ROLE_ARN" {
  value = aws_iam_role.rds_monitoring_role.arn
}