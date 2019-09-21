FROM python:3.6-stretch

LABEL maintainer="andreacolangelo@openforce.it"
LABEL version="1.0.0"
LABEL repository="https://github.com/openforceit/github-actions"
LABEL homepage="https://github.com/openforceit/github-actions"
LABEL com.github.actions.name="GitHub Action to build Openforce Wheelfiles"
LABEL com.github.actions.description="Action that builds and publishes Python wheelfiles of Openforce Odoo modules "
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="blue"

RUN python -m pip install setuptools-odoo 

RUN git config --global user.name "Openforce Builder"
RUN git config --global user.email "builder@openforce.it"

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]

