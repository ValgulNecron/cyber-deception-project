#!/bin/bash

# Array of exception ports
exceptions=(20 21 22 23 25 42 53 69 80 81 110 135 143 221 222 223 389 443 445 880 1080 1123 1161 1433 1521 1723 1883 3000 3001 3306 3307 4543 4843 5060 5432 5443 5445 5900 6379 6667 8000 8008 8080 9080 9200 9443 9822 11211 12433 16662 19200 25565 27017)

# Flush all existing nat rules
iptables -t nat -F

# Redirect all incoming and outgoing TCP traffic on ports 1 through 65535 to localhost:4444, except for the exception ports and ports 15000 to 15100:
iptables -t nat -A PREROUTING -p tcp --dport 1:65535 -j DNAT --to-destination 127.0.0.1:4444
iptables -t nat -A OUTPUT -p tcp --dport 1:65535 -j DNAT --to-destination 127.0.0.1:4444

# Exempt the exception ports from the redirection:
for port in "${exceptions[@]}"; do
  iptables -t nat -A PREROUTING -p tcp --dport "$port" -j ACCEPT
  iptables -t nat -A OUTPUT -p tcp --dport "$port" -j ACCEPT
done

# Exempt ports 15000 to 15100 from the redirection:
iptables -t nat -A PREROUTING -p tcp --dport 15000:15100 -j ACCEPT
iptables -t nat -A OUTPUT -p tcp --dport 15000:15100 -j ACCEPT

# Save the rules
iptables-save