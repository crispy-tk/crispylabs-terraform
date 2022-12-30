resource "aws_iam_role" "iam_role_example" {
  name = var.role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  # Added to Trusted Relationship
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "ExampleAssumRole"
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          AWS = "${var.iam_principal}"
        }
      },
    ]
  })

  tags = var.tags
}

data "aws_iam_policy" "dt_policy_example" {
  name = "AmazonS3ReadOnlyAccess"
}

# AWS Managed Policies to attach to the ROLE
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.iam_role_example.name
  policy_arn = data.aws_iam_policy.dt_policy_example.arn
}