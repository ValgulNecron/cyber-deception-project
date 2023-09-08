FROM ubuntu:latest

RUN apt-get update \
 && apt-get install -y build-essential libssl-dev libffi-dev pkg-config git \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN git clone https://github.com/drk1wi/portspoof.git \
 && cd portspoof \
 && ./configure --prefix=/usr/local \
 && make \
 && sudo make install

RUN iptables -t nat -A PREROUTING -p tcp -m tcp --dport 1:65535 -j REDIRECT --to-ports 4444

CMD ["/usr/local/bin/portspoof", "-s /usr/local/etc/portspoof_signatures"]