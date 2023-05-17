#!/bin/bash
set -e

echo "In the install script for the GCP plugin"

# the basics
apk update && apk upgrade

# env vars
CLI_INSTALL_DIR=/opt/download

# new dir
mkdir -p $CLI_INSTALL_DIR && cd $CLI_INSTALL_DIR

curl https://sdk.cloud.google.com > install.sh && chmod +x ./install.sh
./install.sh --disable-prompts --install-dir=$CLI_INSTALL_DIR

CLI_PATH=$CLI_INSTALL_DIR/google-cloud-sdk/bin
touch /root/.bashrc
echo "export PATH=$PATH:$CLI_PATH" > /root/.bashrc

echo "Finished installing the GCP plugin"
