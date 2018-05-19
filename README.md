# DevOps tools on Kubernetes

This is a set of the following charts with the Helmfile:

- [JIRA Software](atlassian-jira-software)
- [Confluence](atlassian-confluence)
- [Mattermost](https://github.com/mattermost/mattermost-kubernetes)
- GitLab
- Nextcloud
- [SonarQube](https://github.com/kubernetes/charts/tree/master/stable/sonarqube)
- [Nexus](https://github.com/kubernetes/charts/tree/master/stable/sonatype-nexus)
- [Keycloak](https://github.com/kubernetes/charts/tree/master/incubator/keycloak)
- [Creating Databases Job](create-databases-for-devops-tools)


## Getting Started

### Prerequisite

Make sure you have the followings:

- A Kubernetes cluster
- A wildcard domain (e.g. `*.devops.example.com`) pointing to the cluster nodes
- A PostgreSQL database (e.g. RDS)

Install the following tools:

- [Helm](https://github.com/kubernetes/helm)
- [Helmfile](https://github.com/roboll/helmfile)


### Bootstrap

Create `.env` with your environment values.
Note that `.env` is added to `.gitignore` by default but you can remove it.

```sh
DEVOPS_DOMAIN="devops.example.com"
DEVOPS_POSTGRES_HOST="xxx.xxx.us-west-2.rds.amazonaws.com"
DEVOPS_POSTGRES_USER="YOUR_ROOT_USER"
DEVOPS_POSTGRES_PASSWORD="YOUR_ROOT_PASSWORD"
```

Install the Helm charts.

```sh
source .env
helmfile sync
```


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
1. Install a SAML or OIDC plugin, e.g.:
    - [Jira Enterprise SSO with Keycloak](https://marketplace.atlassian.com/plugins/de.codecentric.atlassian.oidc.jira-oidc-plugin/server/overview)
    - [SAML 2.0 Single Sign-On for Jira](https://marketplace.atlassian.com/plugins/com.bitium.jira.SAML2PluginJira/server/overview) (free)
1. Configure SAML or OIDC.

### Setup Confluence

Setup your Confluence:

1. Open https://confluence.example.com.
1. Configure the database.


## Contribution

This is an open source software licensed under Apache-2.0.
Feel free to open issues or pull requests.
