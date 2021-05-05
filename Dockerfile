FROM ubuntu:latest

RUN apt-get update
RUN apt-get install curl -y && curl -s https://install.speedtest.net/app/cli/install.deb.sh | bash
RUN apt-get install speedtest

ENTRYPOINT speedtest
#ENTRYPOINT speedtest --accept-license --accept-gdpr