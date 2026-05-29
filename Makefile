NAMESPACE = roboshop

helm-install:
	git pull
	helm install $(component) . -f values/$(component).yml -n $(NAMESPACE) --create-namespace

helm-upgrade:
	git pull
	helm upgrade $(component) . -f values/$(component).yml -n $(NAMESPACE)

helm-uninstall:
	helm uninstall $(component) -n $(NAMESPACE)
