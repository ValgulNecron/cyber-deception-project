# Explanation


This repo contains all script, dockerfile and docker compose that are required or for QOL

To set up grafana, I used https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/prometheus_grafana_loki,
so you will need to add http://prometheus:9090  as your Data source and import these
json https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/prometheus_grafana_loki/dashboards
The installation script was done with ubuntu in mind.

# SERVICE

Other: 
  - [vaultwarden](https://github.com/dani-garcia/vaultwarden): A bitwarden server written in rust (Password manage)
  - [wg-easy](https://github.com/wg-easy/wg-easy): a web interface to manage a wireguard vpn server
active-defense:
  - [portspoof](https://github.com/drk1wi/portspoof): spoof open port and service
honeypot:
  - [hellpot](https://github.com/yunginnanet/HellPot): a webserver honey pot
    HellPot is an endless honeypot based on Heffalump that sends unruly HTTP bots to hell.
    HellPot will send an infinite stream of data that is *just close enough* to being a real website that they might just stick around until their soul is ripped apart and they cease to exist.
    Under the hood of this eternal suffering is a markov engine that chucks bits and pieces of [The Birth of Tragedy (Hellenism and Pessimism)](https://www.gutenberg.org/files/51356/51356-h/51356-h.htm) by Friedrich Nietzsche at the client using [fasthttp](https://github.com/valyala/fasthttp).
  - [endlessh](https://github.com/skeeto/endlessh): a fake ssh server to block client.
    Endlessh is an SSH tarpit that very slowly sends an endless, random SSH banner. It keeps SSH clients locked up for hours or even days at a time. The purpose is to put your real SSH server on another port and then let the script kiddies get stuck in this tarpit instead of bothering a real server.
management:
  - Grafana, prometheus, nodeexporter, cadvisor: A set of tool that give you information on your server on a dashboard.
  - Portainer: a docker web management tool