# Nextcloud

This is a yet another Nextcloud Helm chart.

This chart bootstraps a deployment with the [nextcloud](https://github.com/nextcloud/docker) image image on a Kubernetes cluster.

Alternative to https://github.com/kubernetes/charts/pull/5180.


## Prerequisites

- Kubernetes 1.9+ with Beta APIs enabled
- PV provisioner support in the underlying infrastructure


## Getting Started

To install the chart with the release name `nextcloud`:

```sh
helm install ./nextcloud --name nextcloud
```

To upgrade to a more recent version of Nextcloud:

```sh
helm upgrade nextcloud
```

To delete the release `nextcloud`:

```sh
helm delete nextcloud
```


## Configuration

The following table lists the configurable parameters of the chart and their default values.

Parameter | Description | Default
----------|-------------|--------
`adminUsername` | Administrator username. | `admin`
`adminPassword` | Administrator password. | Random string
`externalDatabase.type` | Database type. `SQLITE`, `MYSQL` or `POSTGRES` | `SQLITE`
`externalDatabase.host` | Database host. | `nil`
`externalDatabase.database` | Database name. | `nextcloud`
`externalDatabase.username` | Database username. | `nextcloud`
`externalDatabase.password` | Database password. | `nextcloud`
`persistence.enabled` | Create a persistent volume to store data. | `true`
`persistence.size` | Size of a persistent volume. | `8Gi`
`persistence.storageClass` | Type of a persistent volume. | `nil`
`persistence.existingClaim` | Name of the existing persistent volume. | `nil`
`ingress.enabled` |	Enable ingress controller resource.	| `false`
`ingress.hosts`	| Hostnames. | `[nextcloud.example.com]`
`resources.limits` | Pod resource limits. | `{}`
`resources.requests` | Pod resource requests. | `{}`
`nodeSelector` | Node labels for pod assignment | `{}`

If both `adminUsername` and `externalDatabase.type` are empty, auto configuration is disabled and the setup wizard is shown on the first time.


### Resources Limits

It is recommended to set the memory requests and limits to prevent OOM killer.

```yaml
# values.yaml
resources:
  limits:
    memory: 256Mi
  requests:
    memory: 256Mi
```


### Persistence

This chart uses sqlite embedded database by default.
You can set the external database connection, for example:

```yaml
# values.yaml
externalDatabase:
  type: POSTGRES
  host: xxx.us-west-2.rds.amazonaws.com
  database: nextcloud
  username: nextcloud
  password: nextcloud
```

This chart creates a `PersistentVolumeClaim` with 8GB volume by default.
You can set size as follows:

```yaml
# values.yaml
persistence:
  size: 100Gi
```
