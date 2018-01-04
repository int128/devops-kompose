# DevOps Kompose

A compose of following services on Kubernetes.

- Keycloak


## Getting Started

### Prerequisite

TODO

### External database

This project assumes using the external PostgreSQL database such as RDS or Cloud SQL.
Create a secret:

```sh
echo host=xxxx.xxxx.us-west-2.rds.amazonaws.com >> .postgres-credentials
echo admin_user=foo >> .postgres-credentials
echo admin_password=foo >> .postgres-credentials
kubectl create secret generic postgres-credentials --from-env-file .postgres-credentials
```

Create databases:

```sh
kubectl apply -f postgres-create-databases.yaml
```

### Keycloak

Install the Keycloak.

```sh
helm install incubator/keycloak --namespace devops --name keycloak -f helm-keycloak-config.yaml
```

Setup the Keycloak.

1. Open https://keycloak.k8s.example.com.
1. Create a new realm `devops`.
1. Create your user and set your initial password.
1. Create a new group `admin` and add you into the group.
1. Create a new role `admin` and assign all roles of the `realm-management` role.
1. Open https://keycloak.k8s.example.com/auth/admin/devops/console/.
1. Change your password.


## Contribution

This is an open source software licensed under Apache-2.0.
Feel free to open issues or pull requests.
