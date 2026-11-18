# terraform-gcp-datafusion

Terraform module for Cloud Data Fusion. Exercises holden's `policies/gcp/data-fusion` policy set.

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
# apply role
resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike-477416"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "datafusion.instances.create",
    "datafusion.instances.delete",
    "datafusion.instances.get",
    "datafusion.instances.update"
  ]
}

# plan role
resource "google_project_iam_custom_role" "terraform_pike_plan" {
  project     = "pike-477416"
  role_id     = "terraform_pike_plan"
  title       = "terraform_pike_plan"
  description = "A user with least privileges"
  permissions = [
    "datafusion.instances.get"
  ]
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->
