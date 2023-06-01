resource "github_repository" "ansible" {
  for_each = { for idx, repo in var.repos : idx => repo }

  name         = "ansible-role-${each.value.name}"
  description  = each.value.description
  topics       = each.value.topics
  homepage_url = each.value.homepage_url
  visibility   = each.value.visibility
  archived     = each.value.archived

  has_discussions      = false
  has_issues           = true
  allow_merge_commit   = false
  archive_on_destroy   = true
  vulnerability_alerts = true
}

resource "github_actions_secret" "example_secret" {
  for_each = { for idx, repo in var.repos : idx => repo if repo.galaxy }

  repository      = "ansible-role-${each.value.name}"
  secret_name     = "GALAXY_API_KEY"
  plaintext_value = var.galaxy_api_key
}

variable "repos" {
  type = list(object({
    name         = string
    description  = string
    topics       = list(string)
    homepage_url = string
    visibility   = string
    galaxy       = bool
    archived     = bool
  }))
  default = [
    {
      name         = "prometheus-target"
      description  = "Ansible role for pushing targets to prometheus instance"
      topics       = ["ansible", "role", "galaxy", "prometheus", "monitoring", "metrics", "prometheus-exporter", "node-exporter"]
      homepage_url = "https://galaxy.ansible.com/kliwniloc/prometheus_target"
      visibility   = "public"
      galaxy       = true
      archived     = false
    },
    {
      name         = "borgbackup"
      description  = "Ansible role for deploying borgbackup on client and server"
      topics       = ["ansible", "role", "galaxy", "backup", "borgbackup"]
      homepage_url = "https://galaxy.ansible.com/kliwniloc/borgbackup"
      visibility   = "private"
      galaxy       = false
      archived     = false
    },
  ]
}
