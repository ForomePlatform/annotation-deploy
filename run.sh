#!/usr/bin/env bash
source .env
terraform init && terraform plan && terraform apply -auto-approve