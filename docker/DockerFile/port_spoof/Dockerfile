FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y build-essential libssl-dev libffi-dev pkg-config git iptables \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN git clone https://github.com/drk1wi/portspoof.git \
 && cd portspoof \
 && ./configure --prefix=/usr/local \
 && make \
 && make install

COPY iptables.rules /iptables.rules

USER root

CMD iptables-restore < /iptables.rules && /usr/local/bin/portspoof -s /usr/local/etc/portspoof_signatures
