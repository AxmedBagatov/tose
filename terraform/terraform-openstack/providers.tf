terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = ">= 1.49.0"
    }
  }
}

provider "openstack" {
  auth_url    = var.auth_url
  user_name   = var.username
  password    = var.password
  tenant_name = var.project_name
  region      = var.region
}
