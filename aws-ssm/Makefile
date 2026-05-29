ECR_REGISTRY = 293222827824.dkr.ecr.us-east-1.amazonaws.com
IMAGE        = ssm-pull

build:
	docker build -t $(IMAGE):latest .

push: build
	docker tag $(IMAGE):latest $(ECR_REGISTRY)/$(IMAGE):latest
	docker push $(ECR_REGISTRY)/$(IMAGE):latest

tf-apply:
	terraform init
	terraform apply -auto-approve

tf-destroy:
	terraform destroy -auto-approve
