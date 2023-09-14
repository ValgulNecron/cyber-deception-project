# Explanation


This repo contains all script, dockerfile and docker compose that are required or for QOL

To set up grafana, I used https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/prometheus_grafana_loki,
so you will need to add http://prometheus:9090  as your Data source and import these
json https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/prometheus_grafana_loki/dashboards
The installation script was done with ubuntu in mind.


# SERVICE


### Other:

- [vaultwarden](https://github.com/dani-garcia/vaultwarden): A bitwarden server written in rust (Password manage)
- [wg-easy](https://github.com/wg-easy/wg-easy): a web interface to manage a wireguard vpn server
- [lodestrone](https://github.com/Lodestone-Team/lodestone): a minecraft server management software

### Active-defense:

- Need to be intalled on the host system

### Honeypot:

- [hellpot](https://github.com/yunginnanet/HellPot): a webserver honey pot
  HellPot is an endless honeypot based on Heffalump that sends unruly HTTP bots to hell.
  HellPot will send an infinite stream of data that is *just close enough* to being a real website that they might just
  stick around until their soul is ripped apart and they cease to exist.
  Under the hood of this eternal suffering is a markov engine that chucks bits and pieces
  of [The Birth of Tragedy (Hellenism and Pessimism)](https://www.gutenberg.org/files/51356/51356-h/51356-h.htm) by
  Friedrich Nietzsche at the client using [fasthttp](https://github.com/valyala/fasthttp).
- [endlessh](https://github.com/skeeto/endlessh): a fake ssh server to block client.
  Endlessh is an SSH tarpit that very slowly sends an endless, random SSH banner. It keeps SSH clients locked up for
  hours or even days at a time. The purpose is to put your real SSH server on another port and then let the script
  kiddies get stuck in this tarpit instead of bothering a real server.
- [ddospot](https://github.com/aelth/ddospot): A DNS server, NTP server, SSDP server, CHARGEN server, Random/mock UDP server

### Management:

- [Grafana](https://grafana.com/), [prometheus](https://github.com/prometheus/prometheus),
  [nodeexporter](https://github.com/prometheus/node_exporter), [cadvisor](https://github.com/google/cadvisor): A set of
  tool that give you information on your server on a dashboard.
- [Portainer](https://www.portainer.io/): a docker web management tool
- [uptime kuma](https://github.com/louislam/uptime-kuma)

# Portspoof installation


git clone https://github.com/drk1wi/portspoof.git \
&& cd portspoof \
&& ./configure --prefix=/usr/local \
&& make \
&& make install

iptables -t nat -A PREROUTING -p tcp --dport 1:65535 -j DNAT --to-destination 127.0.0.1:4444
please adapt the above command to what you need.
don't forget 19, 54, 123, 161, 1901, 80, 2222, 3000, 3001, 5232, 8080, 9443, 51820, 51821 need to be open + your other service and a ssh port
also have the range 15000 to 15100 open for other stuff like game server 
