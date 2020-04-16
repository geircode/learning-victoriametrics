FROM library/alpine as filecontainer

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl
 
WORKDIR /files

ARG docker_latest_version_file_arg="docker-19.03.2.tgz"
ENV DOCKER_LATEST_VERSION_FILE=${docker_latest_version_file_arg}

RUN echo "Download => https://download.docker.com/linux/static/stable/x86_64/${DOCKER_LATEST_VERSION_FILE}"

RUN curl -fL https://download.docker.com/linux/static/stable/x86_64/${DOCKER_LATEST_VERSION_FILE} -o docker.tgz

ENTRYPOINT tail -f /dev/null