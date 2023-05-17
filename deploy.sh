#!/bin/bash
# shellcheck disable=SC1091
set -e

PLUGIN_NAME="GCP"
PLUGIN_CLI="gcloud"

echo "Running $PLUGIN_NAME Plugin deployment script..."

# vars
export BITOPS_SCHEMA_ENV_FILE="$BITOPS_OPSREPO_ENVIRONMENT_DIR/ENV_FILE"

if [ ! -d "$BITOPS_OPSREPO_ENVIRONMENT_DIR" ]; then
  echo "No $PLUGIN_NAME plugin directory. Skipping."
  exit 0
fi

echo "Deploying $PLUGIN_NAME plugin..."

if [ ! -f "$BITOPS_SCHEMA_ENV_FILE" ]; then 
  echo "No $PLUGIN_NAME plugin ENV file found"
else
  source "$BITOPS_SCHEMA_ENV_FILE"
fi

cd $BITOPS_OPSREPO_ENVIRONMENT_DIR

echo "Listing contents of $PLUGIN_NAME plugin Root: $BITOPS_OPSREPO_ENVIRONMENT_DIR"
ls -la

# TODO: make the env var names dynamic ie:
# varname=${PLUGIN_NAME}_FOO
# echo "$varname: ${!varname}"  <-- but this doesn't work
echo '----------------------------------------'
echo "Options:"
echo "${PLUGIN_NAME}_FOO: $GCP_FOO"
echo "${PLUGIN_NAME}_BAR: $GCP_BAR"

# $PATH is set in .bashrc by the install script
source '/root/.bashrc'
echo 'Checking plugin version'
$PLUGIN_CLI version
echo '----------------------------------------'
