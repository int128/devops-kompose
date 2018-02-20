# DevOps Kompose

A compose of following services on Kubernetes.

- Keycloak
- Grafana
- Prometheus
- JIRA Software

## Getting Started

### Prerequisite

TODO

### External database

This project assumes using the external PostgreSQL database such as RDS or Cloud SQL.

Create `.postgres-credentials` with the following:

```sh
# .postgres-credentials
host=xxxx.xxxx.us-west-2.rds.amazonaws.com
admin_user=foo
admin_password=foo
```

Create databases:

```sh
kubectl create secret generic postgres-credentials -n devops --from-env-file .postgres-credentials
kubectl apply -f config/postgres-create-databases.yaml
```

### Keycloak

Install the Keycloak.

```sh
helm install incubator/keycloak --namespace devops --name keycloak -f config/helm-keycloak.yaml
```

Setup the Keycloak.

1. Open https://keycloak.example.com.
1. Create a new realm `devops`.
1. Create your user and set your initial password.
1. Create a new group `admin` and add you into the group.
1. Create a new role `admin` and assign all roles of the `realm-management` role.
1. Open https://keycloak.example.com/auth/admin/devops/console/.
1. Change your password.

### Kubernetes RBAC with OIDC

WIP

### Prometheus and Grafana

Install Prometheus and Grafana.

```sh
helm install stable/prometheus --namespace kube-system --name prometheus -f config/helm-prometheus.yaml
helm install stable/grafana --namespace kube-system --name grafana -f config/helm-grafana.yaml
```

Add the Prometheus data source to the Grafana.

- Type: Prometheus
- URL: http://prometheus-prometheus-server
- Access: Proxy

### JIRA Software

Install JIRA Software.

TODO: publish helm

```sh
helm install jira --namespace devops --name jira -f config/helm-jira.yaml
```

Open https://jira.example.com and setup.

## Contribution

This is an open source software licensed under Apache-2.0.
Feel free to open issues or pull requests.
