resource "aws_ecr_repository" "main" {
  name         = local.prefix
  force_delete = true
}
