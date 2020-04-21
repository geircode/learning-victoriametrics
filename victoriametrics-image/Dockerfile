FROM python:3.8-slim-buster

WORKDIR /app
COPY . /app

RUN apt-get update
RUN apt-get install -y git dos2unix unzip htop curl inetutils-ping make

ENV VICTORIAMETRICS_VERSION v1.34.9
RUN curl -fL https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/$VICTORIAMETRICS_VERSION/victoria-metrics-$VICTORIAMETRICS_VERSION.tar.gz -o victoria-metrics.tar.gz
# Golang
RUN tar -xzf victoria-metrics.tar.gz -C /usr/local/bin
ENV PATH /usr/local/go/bin:$PATH
RUN go version


ENTRYPOINT tail -f /dev/null