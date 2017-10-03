FROM debian:stretch

ENV LSB_RELEASE stretch
ENV CLOUD_SDK_REPO cloud-sdk-$LSB_RELEASE

RUN apt-get update && \
    apt-get install -y \
      ca-certificates \
      curl \
      jq \
      gnupg \
      apt-transport-https \
    && \
    useradd -m bigquery && \
    :

RUN echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    :

RUN apt-get update && \
    apt-get install -y \
      google-cloud-sdk \
    && \
    :

COPY flight_bigquery /usr/local/bin
