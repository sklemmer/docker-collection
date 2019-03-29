FROM sklemmer/python:3.7
ARG ANSIBLE_VERSION

RUN apk add -u --no-cache \
    build-base=="0.5-r1" \
    libffi-dev=="3.2.1-r6" \
    libressl-dev=="2.7.5-r0" \
  && pip install \
        ansible=="${ANSIBLE_VERSION}" \
        boto3==1.9.123 \
        botocore==1.12.123 \
        docker-py==1.10.6 \
  && apk del build-base libffi-dev libressl-dev