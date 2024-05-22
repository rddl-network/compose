#/bin/bash

rm -rf node-1/data
rm -rf node-2/data
rm -rf node-3/data

mkdir node-1/data
mkdir node-2/data
mkdir node-3/data

echo '{"height":"0","round":0,"step":0}' > node-1/data/priv_validator_state.json
cp node-1/data/priv_validator_state.json node-2/data
cp node-1/data/priv_validator_state.json node-3/data
