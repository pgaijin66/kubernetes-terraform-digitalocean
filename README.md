## Digital Ocean Kubernetes Service ( DOKS )Terraform module

Terraform module to create managed kubernetes in cloud

## Usage

1. Fetch API token from Digital Ocean console

2. Export token into env vars

```
export TF_VAR_do_token="ASAS...REDACTED"
```

3. Import module into you terraform repo

```
# Digital Ocean Kubernetes Service ( DOKS )
module "doks" {
  source            = "git@github.com:pgaijin66/kubernetes-terraform-digitalocean.git"
  do_token          = var.do_token
}
```

4. Run terraform init, plan and apply