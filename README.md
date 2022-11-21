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
  source            = "github.com/pgaijin66/kubernetes-terraform-digitalocean"
  do_token = var.do_token
  cluster_name = "doks_sfo3"
  cluster_region = "sfo3"
  auto_upgrade = true
  node_size = "s-1vcpu-2gb"
  node_count = 1
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