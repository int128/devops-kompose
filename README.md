# DevOps Kubernetes

A compose of the following tools on Kubernetes:

Component | Source
----------|-------
JIRA Software               | Manifest
Confluence                  | Manifest
Mattermost                  | Manifest
GitLab                      | Manifest
Nextcloud                   | Manifest
SonarQube                   | Manifest
Nexus                       | Manifest
Keycloak                    | Helm chart


## Getting Started

Install [Helm](https://github.com/kubernetes/helm) and [Helmfile](https://github.com/roboll/helmfile).

Change `01-env.sh` to your environment. Instead you can create `.env` if you do not want to commit the environment values.

Install the Helm charts.

```sh
helmfile sync
```

Install the manifests.


## Setup DevOps tools

### Setup Keycloak

Create a new realm:

1. Open https://keycloak.example.com.
1. Create a new realm `devops`.
1. Create your user and set your initial password.
1. Create a new group `admin` and add you into the group.
1. Create a new role `admin` and assign all roles of the `realm-management` role.
1. Open https://keycloak.example.com/auth/admin/devops/console/.
1. Change your password.

### Setup JIRA Software

Setup your JIRA Software:

1. Open https://jira.example.com.
1. Configure the database.
1. Install a SAML or OpenID Connect plugin, e.g.:
    - [Jira Enterprise SSO with Keycloak](https://marketplace.atlassian.com/plugins/de.codecentric.atlassian.oidc.jira-oidc-plugin/server/overview)
    - [SAML 2.0 Single Sign-On for Jira](https://marketplace.atlassian.com/plugins/com.bitium.jira.SAML2PluginJira/server/overview) (free)


## Contribution

This is an open source software licensed under Apache-2.0.
Feel free to open issues or pull requests.
