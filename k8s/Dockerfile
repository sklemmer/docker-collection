ARG UBUNTU_VERSION=-20190204
FROM ubuntu:bionic${UBUNTU_VERSION}

LABEL maintainer="sklemmer@knet.network"

# software versions to use, easy to adjust the main ones
ENV ANSIBLE_VERSION="2.7.7"
ENV AWS_CLI_VERSION="1.16.104"
ENV AWS_IAM_AUTH_VERSION="0.3.0"
ENV BOTO3_VERSION="1.9.109"
ENV GITSECRET_VERSION="0.2.4"
ENV HELM_VERSION="v2.12.1"
ENV HELM_DIFF_VERSION="v2.11.0+3"
ENV HELM_PUSH_VERSION="v0.7.1"
ENV HELMSMAN_VERSION="1.7.4"
ENV KUBE_LATEST_VERSION="v1.13.1"
ENV KUBECTX_VERSION="v0.6.3"
ENV KUBEPS1_VERSION="0.6.0"
ENV PYTHON_PIP_VERSION="19.0.2"
ENV TELEPRESENCE_VERSION="0.97"
ENV YQ_VERSION="2.7.2"

# @deprecated use KUBECTX_VERSION
ENV VERSION_KUBECTX "${KUBECTX_VERSION}"
# @deprecated use KUBEPS1_VERSION
ENV VERSION_KUBEPS1 "${KUBEPS1_VERSION}"

# Set admin home dir
ENV ADMIN_HOME /home/admin
# docker flag for automation
ENV IN_DOCKER="yes"
# for helming
ENV HELM_HOME="$ADMIN_HOME/.helm"

# Install apt-get dependencies
RUN apt-get -qq update -y \
 && DEBIAN_FRONTEND=noninteractive \
      apt-get -qq -y install --no-install-recommends \
        curl=7.58.0-2ubuntu3.6 \
        software-properties-common=0.96.24.32.7 \
        gnupg2=2.2.4-1ubuntu1.2 \
 && echo "deb https://dl.bintray.com/sobolevn/deb git-secret main" > /etc/apt/sources.list.d/git-secret.list \
 && echo "deb https://packagecloud.io/datawireio/telepresence/ubuntu/ bionic main" > /etc/apt/sources.list.d/telepresence.list \
 && curl -sLo /tmp/git_secret.key https://api.bintray.com/users/sobolevn/keys/gpg/public.key \
 && curl -sLo /tmp/telepresence.key https://packagecloud.io/datawireio/telepresence/gpgkey \
 && apt-key add /tmp/git_secret.key \
 && apt-key add /tmp/telepresence.key \
 && apt-get -qq update -y \
 && DEBIAN_FRONTEND=noninteractive \
      apt-get -qq -y install --no-install-recommends \
        vim=2:8.0.1453-1ubuntu1 \
        jq=1.5+dfsg-2 \
        bash-completion=1:2.8-1ubuntu1 \
        wget=1.19.4-1ubuntu2.1 \
        git=1:2.17.1-1ubuntu0.4 \
        python3-pip=9.0.1-2.3~ubuntu1 \
        net-tools=1.60+git20161116.90da8a0-1ubuntu1 \
        dnsutils=1:9.11.3+dfsg-1ubuntu1.5 \
        iputils-ping=3:20161105-1ubuntu2 \
        unzip=6.0-21ubuntu1 \
        less=487-0.1 \
        sudo=1.8.21p2-3ubuntu1 \
        groff=1.22.3-10 \
        apt-transport-https=1.6.10 \
        libcap2-bin=1:2.25-1.2 \
        gawk=1:4.1.4+dfsg-1build1 \
        git-secret=${GITSECRET_VERSION} \
        telepresence=${TELEPRESENCE_VERSION} \
 && ln -s /usr/bin/python3 /usr/bin/python \
 && echo "admin ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/00-admin \
 && pip3 install -I pip==${PYTHON_PIP_VERSION} \
 && pip install --no-cache --force-reinstall \
       setuptools==40.8.0 \
 && pip install --no-cache --force-reinstall \
       yq==${YQ_VERSION} \
       ansible==${ANSIBLE_VERSION} \
       awscli==${AWS_CLI_VERSION} \
       boto3==${BOTO3_VERSION} \
 && curl -sLo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl \
 && curl -sLo /usr/local/bin/kubectx https://raw.githubusercontent.com/ahmetb/kubectx/${VERSION_KUBECTX}/kubectx \
 && curl -sLo /usr/local/bin/kubens https://raw.githubusercontent.com/ahmetb/kubectx/${VERSION_KUBECTX}/kubens \
 && curl -sLo /usr/local/bin/kube-ps1 https://raw.githubusercontent.com/jonmosco/kube-ps1/${VERSION_KUBEPS1}/kube-ps1.sh \
 && curl -sLo /usr/local/bin/aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${AWS_IAM_AUTH_VERSION}/heptio-authenticator-aws_${AWS_IAM_AUTH_VERSION}_linux_amd64 \
 && curl -sLo /tmp/helm-${HELM_VERSION}.tar.gz https://kubernetes-helm.storage.googleapis.com/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && curl -sLo /tmp/helmsman-${HELMSMAN_VERSION}.tar.gz https://github.com/Praqma/helmsman/releases/download/v${HELMSMAN_VERSION}/helmsman_${HELMSMAN_VERSION}_linux_amd64.tar.gz \
 && tar -xC /tmp -f /tmp/helm-${HELM_VERSION}.tar.gz linux-amd64/helm --strip-components=1 \
 && tar -xC /tmp -f /tmp/helmsman-${HELMSMAN_VERSION}.tar.gz helmsman \
 && mv /tmp/helm /usr/local/bin/helm \
 && mv /tmp/helmsman /usr/local/bin/helmsman \
 && chmod +x /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectx \
 && chmod +x /usr/local/bin/kubens \
 && chmod +x /usr/local/bin/kube-ps1 \
 && chmod +x /usr/local/bin/helm \
 && chmod +x /usr/local/bin/helmsman \
 && chmod +x /usr/local/bin/aws-iam-authenticator \
 && helm init -c \
 && helm plugin install https://github.com/databus23/helm-diff --version ${HELM_DIFF_VERSION} \
 && helm plugin install https://github.com/chartmuseum/helm-push --version ${HELM_PUSH_VERSION} \
 && rm /tmp/helm-${HELM_VERSION}.tar.gz \
 && rm /tmp/helmsman-${HELMSMAN_VERSION}.tar.gz \
 && setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/kubectl \
 && apt-get autoremove -y software-properties-common \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p ${ADMIN_HOME} \
 && mkdir -p ${ADMIN_HOME}/.kube

