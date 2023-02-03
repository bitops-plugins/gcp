#!/bin/bash
set -e

# env vars
CLI_PKG_NAME=gcli.gz
INSTALL_DIR=/opt/download

# new dir
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR

curl https://sdk.cloud.google.com > install.sh && chmod +x ./install.sh
bash ./install.sh --disable-prompts --install-dir=$INSTALL_DIR

alias gc=$INSTALL_DIR/google-cloud-sdk/bin/gcloud
touch /root/.bashrc
echo "alias gc=$INSTALL_DIR/google-cloud-sdk/bin/gcloud" >> /root/.bashrc

# && apk --no-cache -q add curl tar \
# && ./google-cloud-sdk/bin/gcloud init --no-browser --skip-diagnostics
# alias gc=/opt/download/google-cloud-sdk/bin/gcloud > /root/.bashrc
echo '"gc" is the alias for the gcloud cli... happy googling!'
