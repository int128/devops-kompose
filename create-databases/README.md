# Create databases SQL

This creates databases for DevOps tools.

## Steps

Create a namespace:

```sh
kubectl create namespace devops
```

Create a secret:

```sh
kubectl -n devops create secret generic create-databases \
  "--from-literal=host=$DEVOPS_POSTGRES_HOST" \
  "--from-literal=admin_user=admin_username" \
  "--from-literal=admin_password=admin_password"
```

Apply the manifests:

```sh
kubectl -n devops apply -f create-databases/
```

Make sure the job has been successfully done.

```sh
kubectl -n devops logs -f job/create-databases
```

