#!/bin/bash
# Validating parameters
if [[ $# -ne 1 ]] ; then
    echo "Missing environment parameter."
    exit 1
fi

# Parse Environment
ENVIRONMENT=$1
if [[ ${ENVIRONMENT} != "LOCAL" && ${ENVIRONMENT} != "STAGE" && ${ENVIRONMENT} != "PROD" ]] ; then
    echo "Invalid environment given."
    exit 1
else
    ENVIRONMENT=$(echo ${ENVIRONMENT} | tr '[A-Z]' '[a-z]')
fi
docker-compose -f "docker-compose-${ENVIRONMENT}.yaml" -p "app-${ENVIRONMENT}" down