# Explanation


This repo contains all script, dockerfile and docker compose that are required or for QOL

To set up grafana, I used [this grafana guide](https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/prometheus_grafana_loki),
so you will need to add http://prometheus:9090  as your Data source and import [these
json ](https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/prometheus_grafana_loki/dashboards)


# SERVICE


### Other:
  - [lodestrone](https://github.com/Lodestone-Team/lodestone): a minecraft server management software
  - [pterodactyl](https://pterodactyl.io/): a server manager

### Active-defense:
  - [portspoof](https://github.com/drk1wi/portspoof): Need to be intalled on the host
  - [suricata](https://suricata.io/): Suricata is a high performance, open source network analysis and threat detection software used by most private and public organizations, and embedded by major vendors to protect their assets.

### Honeypot:
  - [hellpot](https://github.com/yunginnanet/HellPot): a webserver honey pot
    HellPot is an endless honeypot based on Heffalump that sends unruly HTTP bots to hell.
    HellPot will send an infinite stream of data that is *just close enough* to being a real website that they might just stick around until their soul is ripped apart and they cease to exist.
    Under the hood of this eternal suffering is a markov engine that chucks bits and pieces of [The Birth of Tragedy (Hellenism and Pessimism)](https://www.gutenberg.org/files/51356/51356-h/51356-h.htm) by Friedrich Nietzsche at the client using [fasthttp](https://github.com/valyala/fasthttp).
  - [endlessh](https://github.com/skeeto/endlessh): a fake ssh server to block client.
    Endlessh is an SSH tarpit that very slowly sends an endless, random SSH banner. It keeps SSH clients locked up for hours or even days at a time. The purpose is to put your real SSH server on another port and then let the script kiddies get stuck in this tarpit instead of bothering a real server.
  - [ddospot](https://github.com/aelth/ddospot): A DNS server, NTP server, SSDP server, CHARGEN server, Random/mock UDP server
  - [honeypots](https://github.com/qeeqbox/honeypots): 30 different honeypots in one package! (dhcp, dns, elastic, ftp, http proxy, https proxy, http, https, imap, ipp, irc, ldap, memcache, mssql, mysql, ntp, oracle, pjl, pop3, postgres, rdp, redis, sip, smb, smtp, snmp, socks5, ssh, telnet, vnc)
    and the docker file from the [tpotce](https://github.com/telekom-security/tpotce) by [Deutsche Telekom Security GmbH](https://github.com/telekom-security)
  - [Cowrie](https://github.com/cowrie/cowrie): Cowrie is a medium to high interaction SSH and Telnet honeypot designed to log brute force attacks and the shell interaction performed by the attacker. In medium interaction mode (shell) it emulates a UNIX system in Python, in high interaction mode (proxy) it functions as an SSH and telnet proxy to observe attacker behavior to another system.
  - [dionaea](https://github.com/DinoTools/dionaea): Dionaea is meant to be a nepenthes successor, embedding python as scripting language, using libemu to detect shellcodes, supporting ipv6 and tls.
  - [Log4Pot](https://github.com/thomaspatzke/Log4Pot): A honeypot for the Log4Shell vulnerability (CVE-2021-44228).

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
don't forget 20, 21, 22, 23, 25, 42, 53, 69, 80, 81, 110, 135, 143, 221, 222, 223, 389, 443, 445, 880, 1080, 1123, 1161, 1433, 1521, 1723, 1883, 3000, 3001, 3306, 3307, 4543, 4843, 5060, 5432, 5443, 5445, 5900, 6379, 6667, 8000, 8008, 8080, 9080, 9200, 9443, 9822, 11211, 12433, 16662, 19200, 25565, 27017 to be open
+ your other service and an ssh port also have the range 15000 to 15100 open for other stuff like game server (15000 to 15010 for mc instance)




