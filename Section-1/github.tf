
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.13.0"
    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "example" {
  name = "terraform-repo"

  visibility = "private"
}
