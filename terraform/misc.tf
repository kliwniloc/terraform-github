resource "github_repository" "terraform-github" {
  name        = "terraform-github"
  description = "Terraform configuration managing my github repositories"
  topics      = ["terraform", "github"]

  visibility = "public"
  archived   = false

  has_discussions = false
  has_projects    = false
  has_issues      = true
  homepage_url    = "https://github.com/kliwniloc"


  vulnerability_alerts = true
  security_and_analysis {
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}
