FROM debian:jessie
MAINTAINER Gerhard Schlager <mail@gerhard-schlager.at>

RUN echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/00InstallRecommends && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y fakepop && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME /etc/fakepop
EXPOSE 110

ENTRYPOINT ["inetd", "-i"]
