# -------------------------------
# S3 Outputs
# -------------------------------

output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.this.arn
}

output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.this.id
}

output "bucket_ownership" {
  description = "The object ownership setting for the S3 bucket"
  value       = aws_s3_bucket_ownership_controls.this.rule[0].object_ownership
}

output "bucket_encryption" {
  description = "Server-side encryption algorithm used by the S3 bucket (empty if not set)"
  value = try(
    one([
      for r in aws_s3_bucket_server_side_encryption_configuration.this.rule :
      r.apply_server_side_encryption_by_default.sse_algorithm
    ]),
    ""
  )
}
