#!/bin/bash

# Clear existing rules
iptables -t nat -F

# Define a list of ports to exclude
excluded_ports="19,22,54,80,123,161,1901,2222,3000,3001,5232,8080,9443,16662,51820,51821,21,9822,23,25,53,8008,110,1123,143,1161,389,443,1080,1433,1521,3306,5060,5432,5900,6379,6667,9080,9200,11211"

# Loop through ports 1-65535 and add DNAT rules for ports not in the exclusion list
for port in $(seq 1 65535); do
    if [[ ! $excluded_ports =~ $port ]]; then
        iptables -t nat -A PREROUTING -p tcp -m tcp --dport $port -j DNAT --to-destination 127.0.0.1:4444
        iptables -t nat -A OUTPUT -p tcp -m tcp --dport $port -j DNAT --to-destination 127.0.0.1:4444
    fi
done

# Allow traffic for specific port ranges (15000-15100)
for port in $(seq 15000 15100); do
    iptables -t nat -A PREROUTING -p tcp -m tcp --dport $port -j ACCEPT
    iptables -t nat -A OUTPUT -p tcp -m tcp --dport $port -j ACCEPT
done

# Display the updated rules
iptables -t nat -L
