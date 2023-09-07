#!/bin/bash

# this is the main script
# it will execute other script and do some verification.

echo "This script assume you already have a 'good' configuration on your server like ssh port changed and other stuff"

echo "Do you want to proceed with the installation of Docker (yes/no)?:"
read response
case $response in
  yes)
    ./scripts/install_docker.sh
    ./scripts/configure_docker.sh
    echo "Switching to the created docker user..."
    sudo su -l docker
    echo "Do you want to build and launch all docker (yes/no)?:"
    read response
    case $response in
    yes)
      ./scripts/launch_docker.sh
      ;;
    no)
      # Cancel installation
      echo "Installation cancelled."
      exit 1
      ;;
    *)
      echo "Invalid input. Please enter either 'yes' or 'no'."
      exit 1
      ;;
  esac
    ;;
  no)
    # Cancel installation
    echo "Installation cancelled."
    exit 1
    ;;
  *)
    echo "Invalid input. Please enter either 'yes' or 'no'."
    exit 1
    ;;
esac

