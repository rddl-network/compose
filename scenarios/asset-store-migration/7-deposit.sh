#!/bin/bash

sudo docker exec compose-planetmint-1-1 planetmint-god tx gov deposit 1 10000stake --from planetmint-1 --fees 1plmnt -y --keyring-backend test
sudo docker exec compose-planetmint-2-1 planetmint-god tx gov deposit 1 10000stake --from planetmint-2 --fees 1plmnt -y --keyring-backend test
sudo docker exec compose-planetmint-3-1 planetmint-god tx gov deposit 1 10000stake --from planetmint-3 --fees 1plmnt -y --keyring-backend test
sudo docker exec compose-planetmint-4-1 planetmint-god tx gov deposit 1 10000stake --from planetmint-4 --fees 1plmnt -y --keyring-backend test
