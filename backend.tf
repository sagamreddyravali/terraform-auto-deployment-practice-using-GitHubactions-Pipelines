terraform {
  backend "s3" {
    bucket       = "ravali-terraform-auto-state-2026"
    key          = "terraform-auto-deployment/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}