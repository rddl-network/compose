FROM ubuntu:22.04

ADD --chmod=0755 https://github.com/rddl-network/shamir-coordinator-service/releases/download/v0.7.0/shamir-coordinator /usr/local/bin/shamir-coordinator-service
RUN useradd -m ubuntu
USER ubuntu

WORKDIR /home/ubuntu

CMD ["shamir-coordinator-service"]