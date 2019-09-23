# Build Odoo Docker Images

Available with `uses = "openforceit/github-actions/build_odoo_docker_images/<version>@<commit-ish>"`

This Action builds the Odoo images used by Openforce to create the users instances.

### Secrets

Not applicable

### Environment variables

* REGISTRY_URL: URL of the Docker Registry
* REGISTRY_USERNAME: Username to log into the registry
* REGISTRY_PASSWORD: Password or token to log into the registry
* IMAGE_NAME: Name of the image to build
* TAG_NAME: Tag of the image to build

