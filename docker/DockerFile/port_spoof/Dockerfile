FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y build-essential libssl-dev libffi-dev pkg-config git iptables \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN git clone https://github.com/drk1wi/portspoof.git \
 && cd portspoof \
 && ./configure --prefix=/usr/local \
 && make \
 && make install

RUN echo "#!/bin/bash" > /setup-iptables.sh && \
    echo "" >> /setup-iptables.sh && \
    echo "# Define the port ranges to be redirected" >> /setup-iptables.sh && \
    echo "port_ranges=(" >> /setup-iptables.sh && \
    echo "    '1-79:4444'" >> /setup-iptables.sh && \
    echo "    '81-2999:4444'" >> /setup-iptables.sh && \
    echo "    '3001-8079:4444'" >> /setup-iptables.sh && \
    echo "    '8081-9089:4444'" >> /setup-iptables.sh && \
    echo "    '9091-9099:4444'" >> /setup-iptables.sh && \
    echo "    '9101-9442:4444'" >> /setup-iptables.sh && \
    echo "    '9444-51819:4444'" >> /setup-iptables.sh && \
    echo "    '51822-65535:4444'" >> /setup-iptables.sh && \
    echo ")" >> /setup-iptables.sh && \
    echo "" >> /setup-iptables.sh && \
    echo "# Flush existing rules" >> /setup-iptables.sh && \
    echo "iptables -F" >> /setup-iptables.sh && \
    echo "" >> /setup-iptables.sh && \
    echo "# Set the default policies" >> /setup-iptables.sh && \
    echo "iptables -P INPUT ACCEPT" >> /setup-iptables.sh && \
    echo "iptables -P FORWARD ACCEPT" >> /setup-iptables.sh && \
    echo "iptables -P OUTPUT ACCEPT" >> /setup-iptables.sh && \
    echo "" >> /setup-iptables.sh && \
    echo "# Loop through and create DNAT rules for each port range" >> /setup-iptables.sh && \
    echo "for range in \"\${port_ranges[@]}\"; do" >> /setup-iptables.sh && \
    echo "    source_port=\$(echo \"\$range\" | cut -d \":\" -f 1)" >> /setup-iptables.sh && \
    echo "    destination_port=\$(echo \"\$range\" | cut -d \":\" -f 2)" >> /setup-iptables.sh && \
    echo "    iptables -t nat -A PREROUTING -p tcp --dport \"\$source_port\" -j DNAT --to-destination \"127.0.0.1:\$destination_port\"" >> /setup-iptables.sh && \
    echo "done" >> /setup-iptables.sh && \
    echo "" >> /setup-iptables.sh && \
    echo "# Save the rules" >> /setup-iptables.sh && \
    echo "iptables-save > /etc/iptables.rules" >> /setup-iptables.sh && \
    echo "" >> /setup-iptables.sh && \
    echo "# Ensure the rules are loaded at boot" >> /setup-iptables.sh && \
    echo "echo '#!/bin/sh' > /etc/network/if-pre-up.d/iptables" >> /setup-iptables.sh && \
    echo "echo 'iptables-restore < /etc/iptables.rules' >> /etc/network/if-pre-up.d/iptables" >> /setup-iptables.sh && \
    echo "chmod +x /etc/network/if-pre-up.d/iptables" >> /setup-iptables.sh && \
    chmod +x /setup-iptables.sh

RUN /setup-iptables.sh

RUN rm /setup-iptables.sh

USER root

CMD iptables-restore < /iptables.rules && /usr/local/bin/portspoof -s /usr/local/etc/portspoof_signatures