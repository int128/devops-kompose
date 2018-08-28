**DEPRECATED:** Use https://docs.gitlab.com/ee/install/kubernetes/gitlab_chart.html instead.

----

# GitLab

This is a yet another GitLab Helm chart.

This chart bootstraps a deployment with the [gitlab/gitlab-ce](https://hub.docker.com/r/gitlab/gitlab-ce/) image image on a Kubernetes cluster.


## Prerequisites

- Kubernetes 1.8+ with Beta APIs enabled
- PV provisioner support in the underlying infrastructure


## Getting Started

To install the chart with the release name `gitlab`:

```sh
helm install ./gitlab --name gitlab
```

To delete the release `gitlab`:

```sh
helm delete gitlab
```


## Configuration

The following table lists the configurable parameters of the chart and their default values.

Parameter | Description | Default
----------|-------------|--------
`gitlab.dbHost` | Database hostname. | ``
`gitlab.dbPort` | Database port. | ``
`gitlab.dbName` | Database name. | `gitlab`
`gitlab.dbUsername` | Database username. | `gitlab`
`gitlab.dbPassword` | Database password. | `gitlab`
`gitlab.externalURL` | URL of the server. | `https://gitlab.example.com`
`gitlab.saml.enabled` | Enable SAML authentication. | `false`
`gitlab.saml.buttonLabel` | Label of the login button. | `Login`
`gitlab.saml.IDPCert` | IDP certification. | `-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----`
`gitlab.saml.IDPSSOTargetURL` | IDP target URL. | `https://idp.example.com`
`persistence.enabled` | Create a persistent volume to store data. | `true`
`persistence.size` | Size of a persistent volume. | `8Gi`
`persistence.storageClass` | Type of a persistent volume. | `nil`
`persistence.existingClaim` | Name of the existing persistent volume. | `nil`
`ingress.enabled` |	Enable ingress controller resource.	| `false`
`ingress.hosts`	| Hostnames. | `[gitlab.example.com]`
`resources.limits` | Pod resource limits. | `{}`
`resources.requests` | Pod resource requests. | `{}`
`nodeSelector` | Node labels for pod assignment | `{}`


### Resources Limits

TODO


### Persistence

This chart creates a `PersistentVolumeClaim` with 8GB volume by default.
You can set size as follows:

```yaml
# values.yaml
persistence:
  size: 100Gi
```


## Upgrade gitlab

To upgrade to a more recent version of gitlab:

```sh
helm upgrade gitlab
```
