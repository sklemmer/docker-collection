FROM debian:strech-slim

ENV ANSIBLE_VERSION: 2.7.4

RUN apt update \
 && apt install vim git unzip wget python-minimal python-pip -y --no-install-recommends \
 && pip install pip --upgrade \
 && pip install ansible==${ANSIBLE_VERSION} \
 && pip install boto3 botocore