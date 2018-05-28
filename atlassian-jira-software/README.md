# Atlassian JIRA Software

This chart bootstraps an Atlassian JIRA Software server using the [cptactionhank/atlassian-jira-software](https://github.com/cptactionhank/docker-atlassian-jira-software) image.


## TL;DR

```sh
helm install --name atlassian-jira-software int128.github.io/atlassian-jira-software
```

You should set the memory requests and limits to prevent OOM killer.

```yaml
resources:
  limits:
    memory: 1536Mi
  requests:
    memory: 1536Mi
```

If your pod runs on 1 core CPU, set the CPU limits to prevent freeze of a node.

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


## Known issues

### Memory

You should set the following parameters to prevent OOM killer.

```
[resources.limits.memory] = [jira.javaHeapSize] + 500MiB
```


### CPU limits

JIRA server consumes much CPU resource on start up and sometimes other pods are killed due to liveness probe on a single core instance.
This chart limits CPU resource to prevent killing other pods by default.
You can safely remove CPU limits on a multi core instance.
