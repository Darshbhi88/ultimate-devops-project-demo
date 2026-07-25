output "s3_bucket_Name" {
  description = "Name of the Bucket"
  value = aws_s3_bucket.s3_bucket.bucket
}

output "dynamo_db_name" {
  description = "Name of DynamoDB Table"
  value = aws_dynamodb_table.dynamodb_table.name
}