resource "aws_ecr_repository" "main" {
  name = local.prefix
}
