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

Execute the Shell script : `make install`


## Test

Execute `make test` and you should see this result:

```shell
sh-3.2$ make
[...]
helm unittest ./charts/*

### Chart [ activities ] ./charts/activities

 PASS  test deployment  charts/activities/tests/deployment_test.yaml
 PASS  test ingress     charts/activities/tests/ingress_test.yaml
 PASS  test service     charts/activities/tests/service_test.yaml

### Chart [ ask ] ./charts/ask

 PASS  test deployment  charts/ask/tests/deployment_test.yaml
 PASS  test ingress     charts/ask/tests/ingress_test.yaml
 PASS  test service     charts/ask/tests/service_test.yaml

### Chart [ brands ] ./charts/brands

 PASS  test service     charts/brands/tests/service_test.yaml
 PASS  test deployment  charts/brands/tests/deployment_test.yaml
 PASS  test ingress     charts/brands/tests/ingress_test.yaml

### Chart [ computers ] ./charts/computers

 PASS  test cronjob     charts/computers/tests/cronjob_test.yaml
 PASS  test deployment  charts/computers/tests/deployment_test.yaml
 PASS  test ingress     charts/computers/tests/ingress_test.yaml
 PASS  test service     charts/computers/tests/service_test.yaml

### Chart [ cpus ] ./charts/cpus

 PASS  test cronjob     charts/cpus/tests/cronjob_test.yaml
 PASS  test deployment  charts/cpus/tests/deployment_test.yaml
 PASS  test ingress     charts/cpus/tests/ingress_test.yaml
 PASS  test service     charts/cpus/tests/service_test.yaml

### Chart [ frontend ] ./charts/frontend

 PASS  test deployment  charts/frontend/tests/deployment_test.yaml
 PASS  test ingress     charts/frontend/tests/ingress_test.yaml
 PASS  test service     charts/frontend/tests/service_test.yaml

### Chart [ gpus ] ./charts/gpus

 PASS  test cronjob     charts/gpus/tests/cronjob_test.yaml
 PASS  test deployment  charts/gpus/tests/deployment_test.yaml
 PASS  test ingress     charts/gpus/tests/ingress_test.yaml
 PASS  test service     charts/gpus/tests/service_test.yaml

Charts:      7 passed, 7 total
Test Suites: 24 passed, 24 total
Tests:       45 passed, 45 total
Snapshot:    10 passed, 10 total
Time:        75.742788ms
```


## Release

Execute `make release` to generate new helm package for each chart.