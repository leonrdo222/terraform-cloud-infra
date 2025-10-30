output "iam_role_name" {
  description = "The name of the IAM role assigned to the EC2 instance"
  value       = aws_iam_role.ec2_role.name
}

output "iam_instance_profile" {
  description = "The name of the IAM instance profile associated with the EC2 instance"
  value       = aws_iam_instance_profile.ec2_profile.name
}
