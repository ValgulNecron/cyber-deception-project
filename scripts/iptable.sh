#!/bin/bash

ports=(20 21 22 23 25 42 53 69 80 81 110 135 143 221 222 223 389 422 443 445 853 880 1080 1123 1161 1433 1521 1723 1883 3000 3001 3306 3307 4543 4843 5060 5432 5443 5445 5900 6379 6667 8000 8008 8080 9080 9200 9443 9822 11211 12433 16662 19200 25565 27017)
for i in $(seq 1 65535); do
  echo $i
  if [ $i -ge 15000 ] && [ $i -le 15100 ]; then
    echo "port between 15000 and 15100"
    continue
  fi
  if [[ "${ports[@]}" =~ "$i" ]]; then
    echo "not doing this excluded port continuing onto the next one"
    continue
  fi
  echo "doing it"
  sudo iptables -t nat -A PREROUTING -p tcp --dport $i -j DNAT --to-destination 127.0.0.1:4444
  sudo iptables -t nat -A OUTPUT -p tcp --dport $i -j DNAT --to-destination 127.0.0.1:4444
  sudo iptables-save
done
# Save the rules
sudo iptables-save
