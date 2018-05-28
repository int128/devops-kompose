# Atlassian Confluence

This chart bootstraps an Atlassian Confluence server using [the official image](https://hub.docker.com/r/atlassian/confluence-server).


## TL;DR

```sh
helm install --name atlassian-confluence int128.github.io/atlassian-confluence
```

You must set the memory parameters to prevent OOM killer.
Minimum requirement is:

```yaml
confluence:
  javaHeapSize: 1024m
resources:
  limits:
    memory: 1800Mi
  requests:
    memory: 1800Mi
```

If your pod runs on single core CPU, set the following parameters to prevent freeze of a node:

```yaml
resources:
  limits:
    cpu: 800m
  requests:
    cpu: 0
```


## Configuration

The following table lists the configurable parameters of the chart and their default values.

Parameter | Description | Default
----------|-------------|--------
`confluence.reverseProxyHost` | Hostname of the server. | `confluence.example.com`
`confluence.reverseProxyPort` | Port of the server. | `443`
`confluence.reverseProxyScheme` | `http` or `https`. | `https`
`confluence.javaHeapSize` | JavaVM heap size passed as `-Xmx` and `-Xms`. | `1024m`
`confluence.javaOptions` | JavaVM memory options. | `-XX:MaxMetaSpaceSize=300m -XX:DirectMemorySize=10m`
`confluence.javaOptions` | JavaVM options. | ``
`synchrony.javaHeapSize` | JavaVM heap size for Synchrony. | `0m` (disable Synchrony)
`persistence.enabled` | Create a persistent volume to store data. | `true`
`persistence.size` | Size of a persistent volume. | `8Gi`
`persistence.storageClass` | Type of a persistent volume. | `nil`
`persistence.existingClaim` | Name of the existing persistent volume. | `nil`
`ingress.enabled` |	Enable ingress controller resource.	| `false`
`ingress.hosts`	| Hostnames. | `[]`
`resources.limits` | Pod resource limits. | `{}`
`resources.requests` | Pod resource requests. | `{}`
`nodeSelector` | Node labels for pod assignment | `{}`


## Known issues

### Memory

You should set the following parameters to prevent OOM killer.

```
[resources.limits.memory] = [confluence.javaHeapSize] + 800MiB
```


### CPU

Confluence server consumes much CPU resource on start up and sometimes other pods are killed due to liveness probe on a single core instance.
This chart limits CPU resource to prevent killing other pods by default.
You can safely remove CPU limits on a multi core instance.
