#!/bin/bash
set -e

echo "Running GCP Plugin deployment script..."
echo

# vars
export GCP_ROOT_SCRIPTS="$BITOPS_INSTALLED_PLUGIN_DIR"
export GCP_ROOT_OPERATIONS="$BITOPS_OPSREPO_ENVIRONMENT_DIR"
export BITOPS_SCHEMA_ENV_FILE="$GCP_ROOT_OPERATIONS/ENV_FILE"
export SCRIPTS_DIR="$GCP_ROOT_SCRIPTS/scripts"

echo "BITOPS_INSTALLED_PLUGIN_DIR: $BITOPS_INSTALLED_PLUGIN_DIR"
echo "BITOPS_PLUGIN_DIR: $BITOPS_PLUGIN_DIR"
echo "GCP_ROOT_SCRIPTS: $GCP_ROOT_SCRIPTS"
echo "GCP_ROOT_OPERATIONS: $GCP_ROOT_OPERATIONS"
echo "BITOPS_SCHEMA_ENV_FILE: $BITOPS_SCHEMA_ENV_FILE"
echo "SCRIPTS_DIR: $SCRIPTS_DIR"
echo 

if [ ! -d "$GCP_ROOT_OPERATIONS" ]; then
  echo "No gcp directory. Skipping."
  exit 0
fi

printf "Deploying gcp..."

if [ ! -f "$BITOPS_SCHEMA_ENV_FILE" ]; then 
  echo "No gcp ENV file found"
else
  source "$BITOPS_SCHEMA_ENV_FILE"
fi

bash $SCRIPTS_DIR/validate_env.sh

cd $GCP_ROOT_OPERATIONS

echo "Listing contents of gcp Root: $GCP_ROOT_OPERATIONS"
ls -al .

echo "settings:"
echo "GCP_FOO"
echo "$GCP_FOO"