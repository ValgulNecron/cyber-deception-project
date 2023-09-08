FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y build-essential libssl-dev libffi-dev pkg-config git sudo \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN git clone https://github.com/drk1wi/portspoof.git \
 && cd portspoof \
 && ./configure --prefix=/usr/local \
 && make \
 && sudo make install

RUN iptables -t nat -I OUTPUT  -p tcp --dport 1:65535 -j DNAT --to-destination 127.0.0.1:4444

CMD ["/usr/local/bin/portspoof", "-s /usr/local/etc/portspoof_signatures"]