# Kubernetes-Helm

## Requirements

* Kubernetes 1.10.X - 1.11.X,
* [Kubectl](https://github.com/kubernetes/kubectl),
* [Helm](https://github.com/helm/helm).


## Services

Create a Kubernetes Cluster with [Kubespray](https://github.com/kubernetes-incubator/kubespray)   


### Deploy

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

Wait few Check if all services is deployed with `kubectl get all --all-namespaces` :

<details><summary>Result</summary>
<p>

```shell
root@node1:~# kubectl get all --all-namespaces
NAMESPACE      NAME                                                       READY     STATUS    RESTARTS   AGE
cert-manager   pod/cert-manager-78fb746bc7-hs6kb                          1/1       Running   0          7h
kube-system    pod/calico-node-6dcvq                                      1/1       Running   2          13d
kube-system    pod/calico-node-7g42v                                      1/1       Running   0          13d
kube-system    pod/calico-node-gtf4s                                      1/1       Running   4          13d
kube-system    pod/kube-apiserver-node1                                   1/1       Running   4          13d
kube-system    pod/kube-controller-manager-node1                          1/1       Running   4          13d
kube-system    pod/kube-dns-775866574-pntns                               3/3       Running   12         13d
kube-system    pod/kube-dns-775866574-tjqfw                               3/3       Running   0          13d
kube-system    pod/kube-proxy-node1                                       1/1       Running   4          13d
kube-system    pod/kube-proxy-node2                                       1/1       Running   2          6h
kube-system    pod/kube-proxy-node3                                       1/1       Running   0          13d
kube-system    pod/kube-scheduler-node1                                   1/1       Running   4          13d
kube-system    pod/kubedns-autoscaler-565b49bbc6-cbrm9                    1/1       Running   4          13d
kube-system    pod/kubernetes-dashboard-7d5dcdb6d9-bgb29                  1/1       Running   0          7h
kube-system    pod/metrics-server-5d78586d76-88d57                        1/1       Running   0          13d
kube-system    pod/nginx-ingress-controller-46fsr                         1/1       Running   1          13d
kube-system    pod/nginx-ingress-controller-gf8nh                         1/1       Running   6          13d
kube-system    pod/nginx-ingress-default-backend-6759dc9bf9-nkt8h         1/1       Running   0          13d
kube-system    pod/nginx-proxy-node2                                      1/1       Running   2          6h
kube-system    pod/nginx-proxy-node3                                      1/1       Running   0          13d
kube-system    pod/tiller-deploy-895d57dd9-8rv87                          1/1       Running   0          6h
metallb        pod/metallb-controller-68fc5cd8bb-q87w4                    1/1       Running   0          13d
metallb        pod/metallb-speaker-4zpll                                  1/1       Running   2          13d
metallb        pod/metallb-speaker-646ql                                  1/1       Running   0          13d
monitoring     pod/alertmanager-kube-prometheus-0                         2/2       Running   0          7h
monitoring     pod/kube-prometheus-exporter-kube-state-54895dd84c-g4rm2   2/2       Running   0          7h
monitoring     pod/kube-prometheus-exporter-node-8gb46                    1/1       Running   3          13d
monitoring     pod/kube-prometheus-exporter-node-k2r5v                    1/1       Running   2          13d
monitoring     pod/kube-prometheus-exporter-node-z59xw                    1/1       Running   0          13d
monitoring     pod/kube-prometheus-grafana-57d5b4d79f-52dbn               2/2       Running   0          13d
monitoring     pod/prometheus-kube-prometheus-0                           3/3       Running   1          6h
monitoring     pod/prometheus-operator-d75587d6-swmqr                     1/1       Running   0          7h
needpc         pod/activities-api-7497b57899-6lsx9                        2/2       Running   0          6h
needpc         pod/ask-api-7bcdd5b9bb-fmk5x                               1/1       Running   0          6h
needpc         pod/ask-api-7bcdd5b9bb-tsjsm                               1/1       Running   0          6h
needpc         pod/brands-api-5d5464476b-tlp6z                            2/2       Running   0          6h
needpc         pod/computers-api-58b9998998-6f86t                         2/2       Running   0          6h
needpc         pod/computers-api-58b9998998-b7bzv                         2/2       Running   0          6h
needpc         pod/cpus-api-d4df5b74-mp9lb                                2/2       Running   0          6h
needpc         pod/frontend-api-54699b7b97-cfcsw                          1/1       Running   0          6h
needpc         pod/frontend-api-54699b7b97-jp96k                          1/1       Running   0          6h
needpc         pod/gpus-api-5984f75cd4-t2c8w                              2/2       Running   0          6h

NAMESPACE     NAME                                                       TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)          AGE
default       service/kubernetes                                         ClusterIP      10.233.0.1      <none>          443/TCP          13d
kube-system   service/kube-dns                                           ClusterIP      10.233.0.3      <none>          53/UDP,53/TCP         13d
kube-system   service/kube-prometheus-exporter-kube-controller-manager   ClusterIP      None            <none>          10252/TCP          13d
kube-system   service/kube-prometheus-exporter-kube-dns                  ClusterIP      None            <none>          10054/TCP,10055/TCP   13d
kube-system   service/kube-prometheus-exporter-kube-etcd                 ClusterIP      None            <none>          4001/TCP          13d
kube-system   service/kube-prometheus-exporter-kube-scheduler            ClusterIP      None            <none>          10251/TCP          13d
kube-system   service/kubelet                                            ClusterIP      None            <none>          10250/TCP          13d
kube-system   service/kubernetes-dashboard                               ClusterIP      10.233.47.197   <none>          443/TCP          13d
kube-system   service/metrics-server                                     ClusterIP      10.233.1.47     <none>          443/TCP          13d
kube-system   service/nginx-ingress-controller                           LoadBalancer   10.233.4.47     192.168.1.240   80:31372/TCP          13d
kube-system   service/nginx-ingress-controller-metrics                   ClusterIP      10.233.15.253   <none>          9913/TCP          13d
kube-system   service/nginx-ingress-controller-stats                     ClusterIP      10.233.14.10    <none>          18080/TCP          13d
kube-system   service/nginx-ingress-default-backend                      ClusterIP      10.233.2.36     <none>          80/TCP          13d
kube-system   service/tiller-deploy                                      ClusterIP      10.233.47.106   <none>          44134/TCP          13d
monitoring    service/alertmanager-operated                              ClusterIP      None            <none>          9093/TCP,6783/TCP     13d
monitoring    service/kube-prometheus                                    ClusterIP      10.233.31.164   <none>          9090/TCP          13d
monitoring    service/kube-prometheus-alertmanager                       ClusterIP      10.233.41.113   <none>          9093/TCP          13d
monitoring    service/kube-prometheus-exporter-kube-state                ClusterIP      10.233.3.176    <none>          80/TCP          13d
monitoring    service/kube-prometheus-exporter-node                      ClusterIP      10.233.46.245   <none>          9100/TCP          13d
monitoring    service/kube-prometheus-grafana                            ClusterIP      10.233.48.71    <none>          80/TCP          13d
monitoring    service/prometheus-operated                                ClusterIP      None            <none>          9090/TCP          13d
needpc        service/activities-api                                     ClusterIP      10.233.28.96    <none>          80/TCP          6h
needpc        service/ask-api                                            ClusterIP      10.233.41.157   <none>          80/TCP          6h
needpc        service/brands-api                                         ClusterIP      10.233.51.147   <none>          80/TCP          6h
needpc        service/computers-api                                      ClusterIP      10.233.12.96    <none>          80/TCP          6h
needpc        service/cpus-api                                           ClusterIP      10.233.60.102   <none>          80/TCP          6h
needpc        service/frontend-api                                       ClusterIP      10.233.51.242   <none>          80/TCP          6h
needpc        service/gpus-api                                           ClusterIP      10.233.52.248   <none>          80/TCP          6h

NAMESPACE     NAME                                           DESIRED   CURRENT   READY     UP-TO-DATE   AVAILABLE   NODE SELECTORAGE
kube-system   daemonset.apps/calico-node                     3         3         3         3            3           <none>13d
kube-system   daemonset.apps/nginx-ingress-controller        2         2         2         2            2           <none>13d
metallb       daemonset.apps/metallb-speaker                 2         2         2         2            2           <none>13d
monitoring    daemonset.apps/kube-prometheus-exporter-node   3         3         3         3            3           <none>13d

NAMESPACE      NAME                                                  DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
cert-manager   deployment.apps/cert-manager                          1         1         1            1           13d
kube-system    deployment.apps/kube-dns                              2         2         2            2           13d
kube-system    deployment.apps/kubedns-autoscaler                    1         1         1            1           13d
kube-system    deployment.apps/kubernetes-dashboard                  1         1         1            1           13d
kube-system    deployment.apps/metrics-server                        1         1         1            1           13d
kube-system    deployment.apps/nginx-ingress-default-backend         1         1         1            1           13d
kube-system    deployment.apps/tiller-deploy                         1         1         1            1           13d
metallb        deployment.apps/metallb-controller                    1         1         1            1           13d
monitoring     deployment.apps/kube-prometheus-exporter-kube-state   1         1         1            1           13d
monitoring     deployment.apps/kube-prometheus-grafana               1         1         1            1           13d
monitoring     deployment.apps/prometheus-operator                   1         1         1            1           13d
needpc         deployment.apps/activities-api                        1         1         1            1           6h
needpc         deployment.apps/ask-api                               2         2         2            2           6h
needpc         deployment.apps/brands-api                            1         1         1            1           6h
needpc         deployment.apps/computers-api                         2         2         2            2           6h
needpc         deployment.apps/cpus-api                              1         1         1            1           6h
needpc         deployment.apps/frontend-api                          2         2         2            2           6h
needpc         deployment.apps/gpus-api                              1         1         1            1           6h

NAMESPACE      NAME                                                             DESIRED   CURRENT   READY     AGE
cert-manager   replicaset.apps/cert-manager-78fb746bc7                          1         1         1         13d
kube-system    replicaset.apps/kube-dns-775866574                               2         2         2         13d
kube-system    replicaset.apps/kubedns-autoscaler-565b49bbc6                    1         1         1         13d
kube-system    replicaset.apps/kubernetes-dashboard-6d4dfd56cb                  0         0         0         13d
kube-system    replicaset.apps/kubernetes-dashboard-7d5dcdb6d9                  1         1         1         13d
kube-system    replicaset.apps/metrics-server-5d78586d76                        1         1         1         13d
kube-system    replicaset.apps/nginx-ingress-default-backend-6759dc9bf9         1         1         1         13d
kube-system    replicaset.apps/tiller-deploy-5c688d5f9b                         0         0         0         13d
kube-system    replicaset.apps/tiller-deploy-895d57dd9                          1         1         1         6h
metallb        replicaset.apps/metallb-controller-57488f874f                    0         0         0         13d
metallb        replicaset.apps/metallb-controller-68fc5cd8bb                    1         1         1         13d
monitoring     replicaset.apps/kube-prometheus-exporter-kube-state-54895dd84c   1         1         1         13d
monitoring     replicaset.apps/kube-prometheus-exporter-kube-state-844bb6f589   0         0         0         13d
monitoring     replicaset.apps/kube-prometheus-grafana-57d5b4d79f               1         1         1         13d
monitoring     replicaset.apps/prometheus-operator-d75587d6                     1         1         1         13d
needpc         replicaset.apps/activities-api-7497b57899                        1         1         1         6h
needpc         replicaset.apps/ask-api-7bcdd5b9bb                               2         2         2         6h
needpc         replicaset.apps/brands-api-5d5464476b                            1         1         1         6h
needpc         replicaset.apps/computers-api-58b9998998                         2         2         2         6h
needpc         replicaset.apps/cpus-api-d4df5b74                                1         1         1         6h
needpc         replicaset.apps/frontend-api-54699b7b97                          2         2         2         6h
needpc         replicaset.apps/gpus-api-5984f75cd4                              1         1         1         6h

NAMESPACE    NAME                                            DESIRED   CURRENT   AGE
monitoring   statefulset.apps/alertmanager-kube-prometheus   1         1         13d
monitoring   statefulset.apps/prometheus-kube-prometheus     1         1         13d

NAMESPACE   NAME                                                 REFERENCE                   TARGETS   MINPODS   MAXPODS   REPLICAS  AGE
needpc      horizontalpodautoscaler.autoscaling/activities-api   Deployment/activities-api   0%/80%    1         2         1  6h
needpc      horizontalpodautoscaler.autoscaling/ask-api          Deployment/ask-api          0%/80%    2         4         2  6h
needpc      horizontalpodautoscaler.autoscaling/brands-api       Deployment/brands-api       0%/80%    1         2         1  6h
needpc      horizontalpodautoscaler.autoscaling/computers-api    Deployment/computers-api    1%/80%    2         4         2  6h
needpc      horizontalpodautoscaler.autoscaling/cpus-api         Deployment/cpus-api         0%/80%    1         2         1  6h
needpc      horizontalpodautoscaler.autoscaling/frontend-api     Deployment/frontend-api     0%/80%    2         4         2  6h
needpc      horizontalpodautoscaler.autoscaling/gpus-api         Deployment/gpus-api         0%/80%    1         2         1  6h

NAMESPACE   NAME                           SCHEDULE     SUSPEND   ACTIVE    LAST SCHEDULE   AGE
needpc      cronjob.batch/scrap-cpu        20 4 * * *   False     0         <none>          6h
needpc      cronjob.batch/scrap-fnac       30 5 * * *   False     0         <none>          6h
needpc      cronjob.batch/scrap-gpu        5 4 * * *    False     0         <none>          6h
needpc      cronjob.batch/scrap-ldlc       0 5 * * *    False     0         <none>          6h
needpc      cronjob.batch/scrap-topachat   40 5 * * *   False     0         <none>          6h
```

</p>
</details>


### Prometheus & Grafana

You can access on the [Grafana dashboards](http://localhost:3000) with the command :   
`kubectl port-forward $(kubectl get  pods --selector=app=kube-prometheus-grafana -n  monitoring --output=jsonpath="{.items..metadata.name}") -n monitoring 3000`

or `make grafana`


## Test Charts Helm

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