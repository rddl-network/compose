FROM ubuntu:22.04

ADD --chmod=0755 https://github.com/rddl-network/shamir-shareholder-service/releases/download/v0.1.3/shamir-shareholder-service /usr/local/bin/shamir-shareholder-service
RUN useradd -m ubuntu
USER ubuntu

CMD ["shamir-shareholder-service"]