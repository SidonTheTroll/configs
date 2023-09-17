#!/bin/bash

# Read credentials from the plain text file
USERNAME=$(grep '^username=' ~/gcm/gcm-config.txt | cut -d '=' -f 2)
PASSWORD=$(grep '^password=' ~/gcm/gcm-config.txt | cut -d '=' -f 2)

# Output credentials in the format expected by Git
echo "username=$USERNAME"
echo "password=$PASSWORD"
