FROM ubuntu:bionic as builder

# software versions to use, easy to adjust the main ones
ARG AWS_IAM_AUTH_VERSION="0.3.0"
ARG HELM_VERSION="v2.12.1"
ARG HELM_DIFF_VERSION="v2.11.0+3"
ARG HELM_PUSH_VERSION="v0.7.1"
ARG HELMSMAN_VERSION="1.7.4"
ARG KUBECTL_VERSION="v1.13.1"
ARG KUBECTX_VERSION="v0.6.3"

LABEL maintainer="sklemmer@knet.network"

# Install apt-get dependencies
RUN apt-get -qq update -y \
 && DEBIAN_FRONTEND=noninteractive \
      apt-get -qq -y install --no-install-recommends \
        curl=7.58.0-2ubuntu3.6 \
        software-properties-common=0.96.24.32.7 \
        gnupg2=2.2.4-1ubuntu1.2 \
 && apt-get -qq update -y \
 && DEBIAN_FRONTEND=noninteractive \
      apt-get -qq -y install --no-install-recommends \
        wget=1.19.4-1ubuntu2.1 \
        git=1:2.17.1-1ubuntu0.4 \
        unzip=6.0-21ubuntu1 \
        apt-transport-https=1.6.10 \
 && curl -sLo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
 && curl -sLo /usr/local/bin/kubectx https://raw.githubusercontent.com/ahmetb/kubectx/${KUBECTX_VERSION}/kubectx \
 && curl -sLo /usr/local/bin/kubens https://raw.githubusercontent.com/ahmetb/kubectx/${KUBECTX_VERSION}/kubens \
 && curl -sLo /usr/local/bin/aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${AWS_IAM_AUTH_VERSION}/heptio-authenticator-aws_${AWS_IAM_AUTH_VERSION}_linux_amd64 \
 && curl -sLo /tmp/helm-${HELM_VERSION}.tar.gz https://kubernetes-helm.storage.googleapis.com/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && curl -sLo /tmp/helmsman-${HELMSMAN_VERSION}.tar.gz https://github.com/Praqma/helmsman/releases/download/v${HELMSMAN_VERSION}/helmsman_${HELMSMAN_VERSION}_linux_amd64.tar.gz \
 && tar -xC /tmp -f /tmp/helm-${HELM_VERSION}.tar.gz linux-amd64/helm --strip-components=1 \
 && tar -xC /tmp -f /tmp/helmsman-${HELMSMAN_VERSION}.tar.gz helmsman \
 && mv /tmp/helm /usr/local/bin/helm \
 && mv /tmp/helmsman /usr/local/bin/helmsman \
 && helm init -c \
 && helm plugin install https://github.com/databus23/helm-diff --version ${HELM_DIFF_VERSION} \
 && helm plugin install https://github.com/chartmuseum/helm-push --version ${HELM_PUSH_VERSION} \
 && chmod +x /usr/local/bin/aws-iam-authenticator \
 && chmod +x /usr/local/bin/helmsman \
 && chmod +x /usr/local/bin/helm \
 && chmod +x /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubens \
 && chmod +x /usr/local/bin/kubectx

# image
FROM bash:5

ENV HELM_HOME="/root/.helm"

COPY --from=builder /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=builder /usr/local/bin/kubens  /usr/local/bin/kubens
COPY --from=builder /usr/local/bin/kubectx /usr/local/bin/kubectx
COPY --from=builder /usr/local/bin/helm /usr/local/bin/helm
COPY --from=builder /usr/local/bin/helmsman /usr/local/bin/helmsman
COPY --from=builder /usr/local/bin/aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
COPY --from=builder /root/.helm /.helm

COPY entrypoint.sh /entrypoint

ENTRYPOINT ["/entrypoint"]
