provider "aws" {
  region  = "us-east-1"
  version = "< 4.0.0"
  # assume_role {
  # The role ARN within Account to AssumeRole into....
  #  role_arn = "arn:aws:iam::369930426721:role/mrlrdb-tst-admin-role"
  #}
}
resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "autofest-useast1-dev-tfstate-s3-001"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name               = "autofest-useast1-dev-tfstate-s3-001",
    Application        = "autofest",
    Consumer           = "gin-autofest-dev@merck.com",
    Costcenter         = "10001286"
    Division           = "IT",          #Valid Values AH, HH, MMD, MRL, TIOE, CTO Org, Ent IT , ITRMS
    Environment        = "Development", #Valid Values "Production", "Development", "Test", "Training", "UAT", "uat", "DR", "POC".
    DataClassification = "Proprietary"  #Valid Values “Public”, “Proprietary”, “Confidential” and “Senuative"
  }
}
resource "aws_s3_bucket_policy" "tfstate_bucket_policy" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  # replace this section with policy file instead
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "TFSTATE-BUCKET-POLICY"
    Statement = [
      {
        Sid    = "DenyEveryoneElse"
        Effect = "Deny"
        Principal = {
          AWS = "*"
        }
        Action = "s3:*"
        Resource = [
          aws_s3_bucket.tf_state_bucket.arn,
          "${aws_s3_bucket.tf_state_bucket.arn}/*",
        ]
        Condition = {
          ArnNotEquals = {
            "aws:PrincipalArn" = [
              "arn:aws:iam::254159895328:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_standard-iam-admin-role_d536bc2b2537ef9b",
              "arn:aws:iam::254159895328:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_standard-base-admin-role_ba7f315c40156552",
              "arn:aws:iam::254159895328:user/srv_deployment_user",
              "arn:aws:iam::254159895328:role/autofest-deployment-role"
            ]
          }
        }
      },
    ]
  })
}
resource "aws_dynamodb_table" "tfstate_dynamodb_table" {
  name           = "autofest-useast1-dev-tfstatedb-001"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  server_side_encryption {
    enabled = true
  }
  attribute {
    name = "LockID"
    type = "S"
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name               = "autofest-useast1-dev-tfstatedb-001",
    Application        = "autofest",
    Consumer           = "gin-autofest-dev@merck.com",
    Costcenter         = "10001286"
    Division           = "IT",          #Valid Values AH, HH, MMD, MRL, TIOE, CTO Org, Ent IT , ITRMS
    Environment        = "Development", #Valid Values "Production", "Development", "Test", "Training", "UAT", "uat", "DR", "POC".
    DataClassification = "Proprietary"
  }
}
