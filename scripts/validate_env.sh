#!/bin/bash
set -e 

if [ -z "$BITOPS_ENVIRONMENT" ]; then
  echo "environment variable (ENVIRONMENT) not set"
  exit 1
else 
  echo "BITOPS_ENVIRONMENT: $BITOPS_ENVIRONMENT"
  exit 0
fi

CLOUDSDK_AUTH_ACCESS_TOKEN=$GCP_ACCESS_TOKEN

# check env var set
if [ -z "$GCP_ACCESS_TOKEN" ]; then
  printf "${ERROR}environment variable (GCP_ACCESS_TOKEN) not set ${NC}"
  exit 1
else 
  printf "${INFO}environment variable GCP_ACCESS_TOKEN is set, thank you!"
fi
