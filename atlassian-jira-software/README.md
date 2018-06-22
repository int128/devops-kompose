# Atlassian JIRA Software

[Atlassian JIRA Software](https://www.atlassian.com/software/jira) is the project management tool for agile teams.

This chart bootstraps a deployment with the [cptactionhank/atlassian-jira-software](https://github.com/cptactionhank/docker-atlassian-jira-software) image image on a Kubernetes cluster.


## Prerequisites

- Kubernetes 1.8+ with Beta APIs enabled
- PV provisioner support in the underlying infrastructure
- At least 2GB Memory


## Getting Started

To install the chart with the release name `atlassian-jira-software`:

```sh
helm install stable/atlassian-jira-software --name atlassian-jira-software
```

It takes a few minutes to bootstrap a JIRA server.
Then open your browser and you will see the [Setup Wizard](https://confluence.atlassian.com/adminjiraserver/running-the-setup-wizard-938846872.html).
The wizard may freeze while database initialization. Hang tight.

To delete the release `atlassian-jira-software`:

```sh
helm delete atlassian-jira-software
```


## Configuration

The following table lists the configurable parameters of the chart and their default values.

Parameter | Description | Default
----------|-------------|--------
`jira.reverseProxyHost` | Hostname of the server. | `jira.example.com`
`jira.reverseProxyPort` | Port of the server. | `443`
`jira.reverseProxyScheme` | `http` or `https`. | `https`
`jira.javaHeapSize` | JavaVM heap memory size. | `1024m`
`jira.javaMemoryOptions` | JavaVM memory options. | See [values.yaml](values.yaml)
`jira.javaOptions` | JavaVM options. | ``
`persistence.enabled` | Create a persistent volume to store data. | `true`
`persistence.size` | Size of a persistent volume. | `8Gi`
`persistence.storageClass` | Type of a persistent volume. | `nil`
`persistence.existingClaim` | Name of the existing persistent volume. | `nil`
`ingress.enabled` |	Enable ingress controller resource.	| `false`
`ingress.hosts`	| Hostnames. | `[]`
`resources.limits` | Pod resource limits. | `{}`
`resources.requests` | Pod resource requests. | `{}`
`nodeSelector` | Node labels for pod assignment | `{}`


### Resources Limits

It is highly recommended to set resources limits for the following reasons.

- Set memory request and limit to prevent containers suddenly die due to OOM killer.
- Set CPU limit to prevent other pods fail liveness probe and die.

You can calculate memory size by:

```
[resources.limits.memory] = [confluence.javaHeapSize] + 1GiB
```

Here is an example of resources limits:

```yaml
# values.yaml
confluence:
  javaHeapSize: 1024m
resources:
  limits:
    memory: 2048Mi
    cpu: 800m
  requests:
    memory: 2048Mi
    cpu: 0
```


### Persistence

Confluence stores data into both database and filesystem.
You can choose one of the following types in the setup wizard:

1. Use an embedded H2 database in the same volume.
1. Use an external database.

This chart creates a `PersistentVolumeClaim` with 8GB volume by default.
You can set size as follows:

```yaml
# values.yaml
persistence:
  size: 100Gi
```


## Upgrade JIRA Software

To upgrade to a more recent version of JIRA Software:

```sh
helm upgrade atlassian-jira-software
```
