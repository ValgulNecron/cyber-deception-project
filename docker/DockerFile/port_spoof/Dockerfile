FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y build-essential libssl-dev libffi-dev pkg-config git iptables \
 && rm -rf /var/lib/apt/lists/*

COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

WORKDIR /app

COPY . /app

RUN git clone https://github.com/drk1wi/portspoof.git \
 && cd portspoof \
 && ./configure --prefix=/usr/local \
 && make \
 && make install

CMD ["/entry.sh"]
