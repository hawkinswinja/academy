DB_NAME ?= hawkinswinja

deploy: 
	@terraform init
	@terraform apply -auto-approve -var="db_name=$(DB_NAME)"

clean:
	@terraform destroy -auto-approve -var="db_name=$(DB_NAME)"
	