FROM python:3.8.6-alpine
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
RUN apk add --no-cache bash
RUN apk update

RUN apk add --no-cache \
    libsodium-dev \
    wget \
    unzip \
    git \
    jq \
    curl \
    rsync \
    openssh


# # env vars
ENV INSTALL_DIR=/opt/gcloud
# new dir
WORKDIR ${INSTALL_DIR}

RUN curl https://sdk.cloud.google.com > install.sh && chmod +x ./install.sh
RUN ./install.sh --disable-prompts --install-dir=${INSTALL_DIR}

RUN echo "alias gc=${INSTALL_DIR}/google-cloud-sdk/bin/gcloud" >> ~/.bashrc

ENTRYPOINT [ "/bin/bash" ]