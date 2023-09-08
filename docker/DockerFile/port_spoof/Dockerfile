FROM ubuntu:latest

RUN apt-get update \
 && apt-get install -y build-essential libssl-dev libffi-dev pkg-config git sudo \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/drk1wi/portspoof.git \
 && cd portspoof \
 && ./configure --prefix=/usr/local \
 && make \
 && sudo make install

RUN sudo nftables -t filter -A INPUT -p tcp --dport 80 -j REDIR --to 4444

CMD ["/usr/local/bin/portspoof", "-s /usr/local/etc/portspoof_signatures"]