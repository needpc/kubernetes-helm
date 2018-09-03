#!/bin/bash

# K8S 1.[10-11].X

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
helm repo add needpc https://needpc.github.io/kubernetes-helm/
helm repo update

# HELM CHART OTHERS
helm install stable/metallb --name metallb --namespace metallb -f configs/metallb-values.yaml
helm install stable/metrics-server --name metrics-server --namespace ${NAMESPACE_SYSTEM} -f configs/metrics-server-values.yaml
helm install coreos/kube-prometheus --name kube-prometheus --set global.rbacEnable=true --namespace ${NAMESPACE_MONITORING} -f configs/prometheus-values.yaml
helm install coreos/prometheus-operator --name prometheus-operator --namespace ${NAMESPACE_MONITORING}
helm install stable/nginx-ingress --name nginx-ingress --namespace ${NAMESPACE_SYSTEM} -f configs/nginx-ingress-values.yaml
helm install stable/ark --name ark --namespace heptio-ark -f configs/ark-values.yaml

# HELM CHART NEEDPC
helm install needpc/activities --name activities --namespace ${NAMESPACE_APP}
helm install needpc/ask --name ask --namespace ${NAMESPACE_APP}
helm install needpc/brands --name brands --namespace ${NAMESPACE_APP}
helm install needpc/computers  --name computers --namespace ${NAMESPACE_APP}
helm install needpc/cpus --name cpus --namespace ${NAMESPACE_APP}
helm install needpc/gpus --name gpus --namespace ${NAMESPACE_APP}
helm install needpc/frontend --name frontend --namespace ${NAMESPACE_APP}