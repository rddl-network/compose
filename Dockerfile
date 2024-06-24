FROM ubuntu:22.04

RUN apt-get update && apt-get install --yes ca-certificates
ADD --chmod=0755 https://github.com/planetmint/planetmint-go/releases/download/v0.9.7/planetmint-god /usr/local/bin/planetmint-god
RUN useradd -m ubuntu
USER ubuntu

CMD ["planetmint-god", "start"]