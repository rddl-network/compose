#!/bin/bash

# reset data dir
rm -rf node-1/data
rm -rf node-2/data
rm -rf node-3/data
rm -rf node-4/data

mkdir node-1/data
mkdir node-2/data
mkdir node-3/data
mkdir node-4/data

echo '{"height":"0","round":0,"step":0}' > node-1/data/priv_validator_state.json
cp node-1/data/priv_validator_state.json node-2/data
cp node-1/data/priv_validator_state.json node-3/data
cp node-1/data/priv_validator_state.json node-4/data

# reset addrbook
rm node-1/config/addrbook.json
echo '{"key":"966e1e4df784bab468772573","addrs": []}' > node-1/config/addrbook.json

rm node-2/config/addrbook.json
echo '{"key":"45c7c5568bc3eaa5d14e3bff","addrs": []}' > node-2/config/addrbook.json

rm node-3/config/addrbook.json
echo '{"key":"8666a4916959a29a28d10db9","addrs": []}' > node-3/config/addrbook.json

rm node-4/config/addrbook.json
echo '{"key":"675d17a7afff70d2dfb57535","addrs": []}' > node-4/config/addrbook.json
