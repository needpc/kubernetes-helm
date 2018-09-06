########################################
#       KUBERNETES-HELM MAKEFILE       #
#       Author: Aurelien PERRIER       #
########################################

all: test

release:
	@sh ./release.sh

install:
	@sh ./install-kubernetes.sh

test: clean
	helm init
	helm plugin install https://github.com/lrills/helm-unittest
	helm unittest ./charts/*

grafana:
	@echo "Grafana http://127.0.0.1:3000"
	@kubectl port-forward $(kubectl get  pods --selector=app=kube-prometheus-grafana -n  monitoring --output=jsonpath="{.items..metadata.name}") -n monitoring 3000

clean:
	@rm -rf ${HOME}/.helm

.PHONY: help release install test clean