#!/bin/bash

sudo docker exec compose-planetmint-1-1 planetmint-god tx gov vote 1 yes --from planetmint-1 --fees 1plmnt --keyring-backend test -y
sudo docker exec compose-planetmint-2-1 planetmint-god tx gov vote 1 yes --from planetmint-2 --fees 1plmnt --keyring-backend test -y
sudo docker exec compose-planetmint-3-1 planetmint-god tx gov vote 1 yes --from planetmint-3 --fees 1plmnt --keyring-backend test -y
sudo docker exec compose-planetmint-4-1 planetmint-god tx gov vote 1 yes --from planetmint-4 --fees 1plmnt --keyring-backend test -y
