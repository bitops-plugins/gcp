#!/bin/bash
set -e

# dnv vars
CLI_PKG_NAME=gcli.gz
CLOUDSDK_AUTH_ACCESS_TOKEN=$GCP_ACCESS_TOKEN

# check env var set
if [ -z "$GCP_ACCESS_TOKEN" ]; then
  printf "${ERROR}environment variable (GCP_ACCESS_TOKEN) not set ${NC}"
  exit 1
fi

# create file with access key
mkdir -p /root/.gcp
cat <<EOF > /root/.gcp/credentials
$GCP_ACCESS_TOKEN
EOF

# new dir
mkdir -p /opt/download
cd /opt/download

# function install_aws_cli() {
    apk update -q \
    && apk --no-cache -q add curl tar python3 powershell \
    && curl -s https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-414.0.0-linux-arm.tar.gz -o $CLI_PKG_NAME \
    && tar -xf $CLI_PKG_NAME  \
    && ./google-cloud-sdk/install.sh --quiet \
    && rm $CLI_PKG_NAME \

    # && ./google-cloud-sdk/bin/gcloud init --no-browser --skip-diagnostics
# }

alias gc=/opt/download/google-cloud-sdk/bin/gcloud
gc auth list