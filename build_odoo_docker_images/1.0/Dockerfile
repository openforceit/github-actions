FROM docker

LABEL maintainer="andreacolangelo@openforce.it"
LABEL version="1.0.0"
LABEL repository="https://github.com/openforceit/github-actions"
LABEL homepage="https://github.com/openforceit/github-actions"
LABEL com.github.actions.name="GitHub Action to build Openforce Odoo Docker Images"
LABEL com.github.actions.description="Action that builds and publishes the Images for Docker Odoo Instances used by Openforce"
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="blue"

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["build"]

