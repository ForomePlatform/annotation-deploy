# Deploy annotation service in IBM Cloud

[Setup Terraform Environment for IBM Cloud](https://ibm.github.io/cloud-enterprise-examples/iac/setup-environment)

It is supposed that you already have your `terraform_key.json`.

Store the API key as the environment variable `IC_API_KEY`:
```bash
export IC_API_KEY=$(grep '"apikey":' terraform_key.json | sed 's/.*: "\(.*\)".*/\1/')
```

Set aws s3 credentials:
```bash
export AWS_ACCESS_KEY=<AWS_ACCESS_KEY>
export AWS_SECRET_KEY=<AWS_SECRET_KEY>
```

Copy `terraform.tfvars.example` to `terraform.tfvars` and reassign variables if necessary.

Deploy with terraform (ansible playbook will be run automatically):
```
terraform init
terraform plan
terraform apply -auto-approve
```

Manually configure with ansible:
```
ansible-playbook main.yml
```

To destroy deployment:
```
terraform apply -destroy -auto-approve
```

***Do not forget to use VPN to be able to connect to the instance through SSH.***