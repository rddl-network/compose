#!/bin/bash

n=500

# Loop to run the command n times
for (( i=1; i<=n; i++ ))
do  
    # Generate a random string using openssl
    random_value=$(openssl rand -base64 10 | tr -d /=+ | cut -c 1-10)

    # Run the command with the random string
    planetmint-god tx asset notarize-asset "$random_value" --from machine --fees 1plmnt -y --keyring-backend test --offline -s $i -a 10
done