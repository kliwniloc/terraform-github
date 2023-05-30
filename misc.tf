resource "github_repository" "terraform-github" {
  name        = "terraform-github"
  description = "Terraform configuration managing my github repositories"
  topics      = ["terraform", "github"]

  visibility = "private"
  archived   = false

  has_discussions = false
  has_issues      = true
}
