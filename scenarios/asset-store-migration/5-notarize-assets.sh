#!/bin/bash

n=500

# Loop to run the command n times
for (( i=1; i<=n; i++ ))
do  
    # Generate a random string using openssl
    random_value=$(openssl rand -base64 10 | tr -d /=+ | cut -c 1-10)

    # Run the command with the random string
    planetmint-god tx asset notarize-asset "$random_value" --from plmnt10mq5nj8jhh27z7ejnz2ql3nh0qhzjnfvy50877 --fees 1plmnt -y --keyring-backend test --offline -s $i -a 10
done