#!/bin/bash
set -e 

if [ -z "$BITOPS_ENVIRONMENT" ]; then
  echo "environment variable (ENVIRONMENT) not set"
  exit 1
else 
    echo "BITOPS_ENVIRONMENT: $BITOPS_ENVIRONMENT"
    exit 0
fi