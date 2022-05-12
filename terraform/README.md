# Deploy annotation service in IBM Cloud

[Setup Terraform Environment for IBM Cloud](https://ibm.github.io/cloud-enterprise-examples/iac/setup-environment)

It is supposed that you already have your `terraform_key.json`.

Store the API key as the environment variable `IC_API_KEY`:
```bash
export IC_API_KEY=$(grep '"apikey":' terraform_key.json | sed 's/.*: "\(.*\)".*/\1/')
```

Set Azure API key as `ARM_ACCESS_KEY`:
```bash
export ARM_ACCESS_KEY=<ARM_ACCESS_KEY>
```

Set aws s3 credentials:
```bash
export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
```

Set mysql user and password:
```bash
export MYSQL_USER=<MYSQL_USER>
export MYSQL_PASSWORD=<MYSQL_PASSWORD>
```

Set frontend apikey:
```bash
export FRONTEND_APIKEY=<FRONTEND_APIKEY>
```

Set slack webhook and channel:
```bash
export SLACK_WEBHOOK=<SLACK_WEBHOOK>
export SLACK_CHANNEL=<SLACK_CHANNEL>
```

Set variables for Azure DevOps pipelines:
```bash
export AZURE_PAT=
export AZURE_ORG=
export AZURE_PRJ=
export AZURE_CALLBACK_PIPELINE_ID=
```

Or you can set all of environments above in .env file.
Copy `.env.example` to `.env` and set environments:
```shell
source .env
```

Copy `terraform.tfvars.example` to `terraform.tfvars` and reassign variables if necessary.

Create terraform workspace if you want to deploy specific instance (default workspace is `default`):
```bash
terraform workspace new dev
terraform workspace new stage
terraform workspace new prod
```

Select proper workspace:
```bash
terraform workspace select dev
```

Deploy with terraform (repeat for each workspace):
```
terraform init
terraform plan
terraform apply -auto-approve
```

Configure with ansible:
```bash
ansible-playbook main.yml --inventory=<workspace_name>.ini
```

To destroy deployment:
```bash
terraform apply -destroy -auto-approve
```

***Do not forget to use VPN to be able to connect to the instance through SSH.***