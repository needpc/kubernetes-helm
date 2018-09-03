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

clean:
	@rm -rf ${HOME}/.helm

.PHONY: help release install test clean