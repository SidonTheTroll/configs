#!/bin/bash

# PLACE BOTH .txt AND .sh FILES IN ~/GCM/ FOLDER

# Read credentials from the plain text file
USERNAME=$(grep '^username=' $HOME/gcm/gcm-config.txt | cut -d '=' -f 2)
PASSWORD=$(grep '^password=' $HOME/gcm/gcm-config.txt | cut -d '=' -f 2)

# Output credentials in the format expected by Git
echo "username=$USERNAME"
echo "password=$PASSWORD"
