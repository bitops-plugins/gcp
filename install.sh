#!/bin/bash
set -e

# env vars
CLI_PKG_NAME=gcli.gz

# new dir
mkdir -p /opt/download
cd /opt/download

curl -s https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-414.0.0-linux-arm.tar.gz -o $CLI_PKG_NAME \
&& tar -xf $CLI_PKG_NAME  \
&& ./google-cloud-sdk/install.sh --quiet \
&& rm $CLI_PKG_NAME \

# && apk --no-cache -q add curl tar \
# && ./google-cloud-sdk/bin/gcloud init --no-browser --skip-diagnostics
# alias gc=/opt/download/google-cloud-sdk/bin/gcloud > /root/.bashrc
# gc info