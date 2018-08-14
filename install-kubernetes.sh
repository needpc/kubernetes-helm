#!/bin/bash

# K8S 1.[10-11].X

# VARS DOCKER REGISTRY / KUBERNETES
DOCKER_HOST=quay.io
DOCKER_USERNAME=a.perrier89@gmail.com
DOCKER_PASSWORD=YuEyK7geWEKsCTjw

# NAMESPACES
NAMESPACE_SYSTEM=kube-system
NAMESPACE_MONITORING=monitoring
NAMESPACE_APP=needpc

# NAMESPACES
kubectl apply -f namespaces.yaml
kubectl apply -f secrets.yaml # create file if not exist

for f in rbac/*.yaml; do 
    kubectl apply -f $f
done

# DASHBOARD K8S
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

# HELM
helm init --service-account tiller --upgrade
helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/
helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
helm repo update

# HELM CHART INSTALL (REMOTE)
helm install stable/metallb --name metallb --namespace metallb -f configs/metallb-values.yaml
helm install stable/metrics-server --name metrics-server --namespace ${NAMESPACE_SYSTEM} -f configs/metrics-server-values.yaml
helm install coreos/kube-prometheus --name kube-prometheus --set global.rbacEnable=true --namespace ${NAMESPACE_MONITORING} -f configs/prometheus-values.yaml
helm install coreos/prometheus-operator --name prometheus-operator --namespace ${NAMESPACE_MONITORING}
helm install stable/nginx-ingress --name nginx-ingress --namespace ${NAMESPACE_SYSTEM} -f configs/nginx-ingress-values.yaml
helm install stable/ark --name ark --namespace heptio-ark -f configs/ark-values.yaml

# HELM CHART INSTALL (LOCAL)
helm install ./charts/activities  --name activities --namespace ${NAMESPACE_APP}
helm install ./charts/ask  --name ask --namespace ${NAMESPACE_APP}
helm install ./charts/brands  --name brands --namespace ${NAMESPACE_APP}
helm install ./charts/computers  --name computers --namespace ${NAMESPACE_APP}
helm install ./charts/cpus  --name cpus --namespace ${NAMESPACE_APP}
helm install ./charts/gpus  --name gpus --namespace ${NAMESPACE_APP}
helm install ./charts/frontend  --name frontend --namespace ${NAMESPACE_APP}

