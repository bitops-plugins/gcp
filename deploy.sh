#!/bin/bash
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
ls -l

echo "Options:"
echo "GCP_FOO: $GCP_FOO"
echo "GCP_BAR: $GCP_BAR"

# here is the image using the installed cli
echo "Running the plugin CLI... later"
# $PLUGIN_CLI version
