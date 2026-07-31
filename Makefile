apply:
	terraform init
	terraform apply -auto-approve  -var-file=env-dev/main.tfvars

destroy: 
	terraform init
	terraform destroy -auto-approve  -var-file=env-dev/main.tfvars
