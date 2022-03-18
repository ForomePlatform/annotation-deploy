# Deploy annotation service in IBM Cloud

[Setup Terraform Environment for IBM Cloud](https://ibm.github.io/cloud-enterprise-examples/iac/setup-environment)

Store the API key as the environment variable `IC_API_KEY`.

Copy `terraform.tfvars.example` to `terraform.tfvars` and reassign variables if necessary.

Deploy with terraform:
```
terraform init
terraform plan
terraform apply
terraform destroy
```

Additional commands:
```
terraform init -upgrade
terraform apply -auto-approve
terraform apply -destroy -auto-approve
```

Connect to instance:
```
ssh -i $YOUR_SSH_PRIVATE_KEY $USER_NAME@$INSTANCE_EXTERNAL_IP
```
