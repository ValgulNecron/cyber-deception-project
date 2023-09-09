#!/bin/bash
set -e

# Configure iptables
iptables -t nat -A PREROUTING -p tcp --dport 1:79 -j DNAT --to-destination 127.0.0.1:4444

# Run your application
/usr/local/bin/portspoof -s /usr/local/etc/portspoof_signatures