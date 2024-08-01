FROM ubuntu:22.04

#System RUN
RUN apt-get update && \
    apt-get install -y wget tar gzip

#Install GO
ENV GO_VERSION=1.22.5

RUN wget https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz && \
    rm go$GO_VERSION.linux-amd64.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"

RUN go version

####

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir /app

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

