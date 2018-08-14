# Kubernetes-Helm

## Requirements

* Kubernetes 1.10.X - 1.11.X,
* [Kubectl](https://github.com/kubernetes/kubectl),
* [Helm](https://github.com/helm/helm).

## Deploy

Create `secrets.yaml` file for Kubernetes with secrets :
```
---
apiVersion: v1
kind: Secret
metadata:
  name: needpc-k8s-pull-secret
  namespace: needpc
data:
  .dockerconfigjson: <base64 JSON>
type: kubernetes.io/dockerconfigjson

---
apiVersion: v1
kind: Secret
metadata:
  name: database-config
  namespace: needpc
type: Opaque
data:
  database: <base64 database name>
  username: <base64 username>
  password: <base64 password>
  host: <base64 host>
```

Execute the Shell script : `bash install-kubernetes.sh`
