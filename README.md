# terraform_gcp


## Init

> Team can use this terraform plan to provision GCP.

This demonstrates the provisioning of a two compute VM(`f1-micro`) in GCP inside a custom created VPC with firewall rules attached to it.

```bash
$ terraform init
```

This will create the `terraform.tfstate` file

## Running it

```bash
$ terraform plan 
$ terraform apply 
```