#!/bin/bash

echo "Launching management docker."
# Launch management service
docker compose -f ../docker/compose-management.yml up -d --build

echo "Launching honeypot docker."
# Launch honeypot service
docker compose -f ../docker/compose-honeypot.yml up -d --build

# Launch active defence service
echo "Launching other active defence docker."
docker compose -f ../docker/compose-active-defence.yml up -d --build

echo "Launching other docker."
# Launch other service
docker compose -f ../docker/compose-other.yml up -d --build

