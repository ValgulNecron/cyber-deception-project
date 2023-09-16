# Explanation


This repo contains all script, dockerfile and docker compose that are required or for QOL

To set up grafana, I used [this grafana guide](https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/prometheus_grafana_loki),
so you will need to add http://prometheus:9090  as your Data source and import [these
json ](https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/prometheus_grafana_loki/dashboards)


# SERVICE


### Other:
- [vaultwarden](https://github.com/dani-garcia/vaultwarden): A bitwarden server written in rust (Password manage)
  - [wg-easy](https://github.com/wg-easy/wg-easy): a web interface to manage a wireguard vpn server
  - [lodestrone](https://github.com/Lodestone-Team/lodestone): a minecraft server management software
  - [radicale](https://github.com/Kozea/Radicale): A CalDAV (calendars, to-do lists) and CardDAV (contacts) server

### Active-defense:
  - Need to be intalled on the host system

### Honeypot:
  - [hellpot](https://github.com/yunginnanet/HellPot): a webserver honey pot
    HellPot is an endless honeypot based on Heffalump that sends unruly HTTP bots to hell.
    HellPot will send an infinite stream of data that is *just close enough* to being a real website that they might just stick around until their soul is ripped apart and they cease to exist.
    Under the hood of this eternal suffering is a markov engine that chucks bits and pieces of [The Birth of Tragedy (Hellenism and Pessimism)](https://www.gutenberg.org/files/51356/51356-h/51356-h.htm) by Friedrich Nietzsche at the client using [fasthttp](https://github.com/valyala/fasthttp).
  - [endlessh](https://github.com/skeeto/endlessh): a fake ssh server to block client.
    Endlessh is an SSH tarpit that very slowly sends an endless, random SSH banner. It keeps SSH clients locked up for hours or even days at a time. The purpose is to put your real SSH server on another port and then let the script kiddies get stuck in this tarpit instead of bothering a real server.
  - [dshield](https://github.com/xme/dshield-docker) This Docker container starts a SSH honeypot (based on Cowrie[1]) and enables the DShield output module to report statistics to the SANS ISC DShield project. This project is based on Johannes Ulrich's Raspberry Pi sensor project[2].
  - [ddospot](https://github.com/aelth/ddospot): A DNS server, NTP server, SSDP server, CHARGEN server, Random/mock UDP server
  - [honeypots](https://github.com/qeeqbox/honeypots): 30 different honeypots in one package! (dhcp, dns, elastic, ftp, http proxy, https proxy, http, https, imap, ipp, irc, ldap, memcache, mssql, mysql, ntp, oracle, pjl, pop3, postgres, rdp, redis, sip, smb, smtp, snmp, socks5, ssh, telnet, vnc)
    and the docker file from the [tpotce](https://github.com/telekom-security/tpotce) by [Deutsche Telekom Security GmbH](https://github.com/telekom-security)

### Management:
  - [Grafana](https://grafana.com/), [prometheus](https://github.com/prometheus/prometheus),
    [nodeexporter](https://github.com/prometheus/node_exporter), [cadvisor](https://github.com/google/cadvisor): A set of
    tool that give you information on your server on a dashboard.
  - [Portainer](https://www.portainer.io/): a docker web management tool
  - [uptime kuma](https://github.com/louislam/uptime-kuma): Uptime Kuma is an easy-to-use self-hosted monitoring tool.
  - [Watchtower](https://containrrr.dev/watchtower/): A container-based solution for automating Docker container base image updates.

# Portspoof installation


git clone https://github.com/drk1wi/portspoof.git 
&& cd portspoof 
&& ./configure --prefix=/usr/local 
&& make 
&& make install

 OR IF IN ARCH OR A DISTRO THAT HAVE AUR  

yay -Syu portspoof-git  

  iptables -t nat -A PREROUTING -p tcp --dport 1:65535  -j DNAT --to-destination 127.0.0.1:4444 
please adapt the above command to what you need. 
don't forget 19, 22, 54, 80, 123, 161, 1901, 3000, 3001, 5232, 8080, 9443, 16662, 51820, 51821 
and 21 9822 23 25 53 8008 110 1123 143 1161 389 443 1080 1433 1521 3306 5060 5432 5900 6379 6667 9080 9200 11211 to be open
+ your other service and a ssh port also have the range 15000 to 15100 open for other stuff like game server (15000 to 15010 for mc instance)




