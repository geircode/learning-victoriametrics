FROM geircode/learning-victoriametrics-filecontainer:latest as filecontainer

FROM python:3.8-slim-buster

WORKDIR /app
COPY . /app

RUN apt-get update
RUN apt-get install -y git dos2unix unzip htop curl inetutils-ping make

RUN pip install -r requirements.txt 

WORKDIR /files
COPY --from=filecontainer /files .
RUN ls -al

# Docker CLI
RUN tar --strip-components=1 -xvzf docker.tgz -C /usr/local/bin

# Golang
RUN tar -xzf go.linux-amd64.tar.gz -C /usr/local
ENV PATH /usr/local/go/bin:$PATH
RUN go version

# RUN rm *

WORKDIR /app

# Make all shell scripts default executable
RUN find . -name "*.sh" -print && \
    find /app -name "*.sh" -execdir chmod u+x {} +

ENTRYPOINT tail -f /dev/null