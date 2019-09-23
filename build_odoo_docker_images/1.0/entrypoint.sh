#!/usr/bin/env sh
# Author(s): Andrea Colangelo (andreacolangelo@openforce.it)
# Copyright 2019 Openforce Srls Unipersonale (www.openforce.it)
# License LGPL-3.0 or later (https://www.gnu.org/licenses/lgpl).

set -e

_error() {
  echo "$1 Aborting build."
  exit 1
}

_pre_flight_checks() {
    if [ -z "${REGISTRY_URL}" ]; then
      _error "REGISTRY_URL is not set."
    fi

    if [ -z "${REGISTRY_USERNAME}" ]; then
      _error "REGISTRY_USERNAME is not set."
    fi

    if [ -z "${REGISTRY_PASSWORD}" ]; then
      _error "REGISTRY_PASSWORD is not set."
    fi

    if [ -z "${IMAGE_NAME}" ]; then
      _error "IMAGE_NAME is not set."
    fi

    if [ -z "${TAG_NAME}" ]; then
      _error "TAG_NAME is not set."
    fi
}

do_all(){
    echo "Logging in to registry"
    echo ${REGISTRY_PASSWORD} | docker login -u ${REGISTRY_USERNAME} --password-stdin ${REGISTRY_URL}

    echo "Building image ${REGISTRY_URL}/${IMAGE_NAME}:${TAG_NAME}."
    docker build -t ${REGISTRY_URL}/${IMAGE_NAME}:${TAG_NAME} .
    echo "Build completed."

    echo "Pushing ${REGISTRY_URL}/${IMAGE_NAME}:${TAG_NAME} to registry."
    docker push ${REGISTRY_URL}/${IMAGE_NAME}:${TAG_NAME}

    if [ "${LATEST}" == "true" ]; then
      echo "docker tag ${IMAGE_NAME}:latest"
      docker tag ${REGISTRY_URL}/${IMAGE_NAME}:${TAG_NAME} ${REGISTRY_URL}/${IMAGE_NAME}:latest

      echo "docker push ${REGISTRY_URL}/${IMAGE_NAME}:latest"
      docker push ${REGISTRY_URL}/${IMAGE_NAME}:latest
    fi
    echo "Image ${REGISTRY_URL}/${IMAGE_NAME}:${TAG_NAME} succesfully published. Logging out"
    docker logout
}

# Entrypoint for this script
case $1 in
  build)
    _pre_flight_checks
    do_all
    ;;
  *)
    _error "Option not valid."
    ;;
esac
