#!/bin/bash

echo "Creating network..."
sudo docker network create --subnet=172.20.0.0/16 main > /dev/null


