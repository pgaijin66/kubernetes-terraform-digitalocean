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


## Result

Importing and running the terraform code will result in following

1. A kubernetes cluster in digital ocean
2. Two node pool : frontend and backend
3. One node in each pool
4. Cluster auto upgrade enabled
5. Maintenance timeslot defined to every week at "4:00AM" on Sunday ( This can be overrided )