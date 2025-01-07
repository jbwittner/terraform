# terraform
Repository pour manager et provisionner l'infrastructure en tant que code en utilisant Terraform.

## Backend
GCP Storage Bucket est utilisé comme backend pour stocker l'état de Terraform.

## Installation
### Terraform
Il est nécessaire d'installer Terraform => https://developer.hashicorp.com/terraform/install?product_intent=terraform

Attention, dans le cas de Fedora il est nécessaire de faire ceci :
```bash
sudo dnf install -y dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install terraform
```

### GCP cli
Il est nécessaire d'installer GCP cli => https://cloud.google.com/sdk/docs/install

## GCP credentials
Pour se connecter il faut suivre la procédure suivante => https://cloud.google.com/docs/terraform/resource-management/store-state#before-you-begin

## Notes

Il est possible d'avoir une limite avec github, pour vérifier cela il faut se servir de la commande suivante :

```bash
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer xxxx" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/rate_limit
```