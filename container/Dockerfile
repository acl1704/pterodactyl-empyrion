FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:xapienz/curl34 && \
    apt-get update && \
    apt-get install -y net-tools tar unzip curl ca-certificates openssl git sqlite fontconfig tzdata iproute2 xz-utils gnupg2 xvfb && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    curl -s https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
    apt-add-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' && \
    apt-get install -y wine-staging=4.10~bionic wine-staging-i386=4.10~bionic wine-staging-amd64=4.10~bionic winetricks && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
