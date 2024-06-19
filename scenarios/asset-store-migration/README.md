# Scenario: Asset store migration
This scenarios shows how to register a machine and notarize assets to verify the functionality of the store migration from planetmint-god `v0.9.7` to `v0.10.0`.

## Prerequisites
Download planetmint-god v0.9.7 binary

`wget https://github.com/planetmint/planetmint-go/releases/download/v0.9.7/planetmint-god`

Download planetmint-god v0.10.0 binary

`wget https://github.com/planetmint/planetmint-go/releases/download/v0.10.0/planetmint-god`

**Caveat:** Give the binaries distinct names.

Add the scenario and binary volumes to `compose.yml`:
```yaml
planetmint-1:
    volumes:
        - ./scenarios/asset-store-migration:/home/ubuntu/scripts:rw
        - ./planetmint-god:/usr/local/bin/planetmint-god
        - ./planetmint-god-v0100:/usr/local/bin/planetmint-god-v0100
```

# Steps
```bash
# Spin up the network
sudo docker compose up
```

From another terminal:
```bash
# Connect to Node 1
sudo docker exec -it compose-planetmint-1-1 /bin/bash

# Store assets on planetmint-god v0.9.7
cd ~/scripts
./1-add-keys.sh
./2-register-trust-anchor.sh
./3-fund-machine.sh
./4-attest-machine.sh
./5-notarize-assets.sh

# Submit upgrade proposal
./6-submit-proposal.sh
```

From another terminal:
```bash
# Deposit on all 4 nodes
sudo ./scenarios/asset-store-migration/7-deposit.sh

# Vote yes on all 4 nodes
sudo .scenarios/asset-store-migration/8-vote.sh
```

Wait for block height 50. Your nodes will stop producing blocks and you should see something like this:
```bash
planetmint-1-1  | 8:00AM ERR UPGRADE "v0.10.0" NEEDED at height: 50:  module=server
```

Then stop your containers and update the command on all four nodes in `compose.yml`:
```yaml
planetmint-1:
    command: planetmint-god-v0100 start
```


```bash
# Spin up network
sudo docker compose up

# Connect to a node
sudo docker exec -it compose-planetmint-1-1 /bin/bash

# Use updated query to verify store migration
planetmint-god-v0100 q asset address plmnt10mq5nj8jhh27z7ejnz2ql3nh0qhzjnfvy50877 10
```
