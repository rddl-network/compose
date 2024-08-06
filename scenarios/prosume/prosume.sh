#!/bin/bash

r2d2="number judge garbage lock village slush business upset suspect green wrestle puzzle foil tragic drum stereo ticket teach upper bone inject monkey deny portion"
c3po="letter plate husband impulse grid lake panel seminar try powder virtual run spice siege mutual enhance ripple country two boring have convince symptom fuel"

echo $r2d2 | planetmint-god keys add r2d2 --recover --keyring-backend test
echo $c3po | planetmint-god keys add c3po --recover --keyring-backend test

planetmint-god tx machine register-trust-anchor '{"pubkey": "03c4d4ebad52b77574b467b23e35241a610e2ca8176c099461608265a2e74c53df"}' -y  --from planetmint-1 --fees 1plmnt --keyring-backend test -a 0 -s 1 --offline
planetmint-god tx machine register-trust-anchor '{"pubkey": "03eb685b107bfa421005e48c7d15dbb1fc9579b0ce60e5ec67696c30de57cf2ca3"}' -y  --from planetmint-1 --fees 1plmnt --keyring-backend test -a 0 -s 2 --offline

planetmint-god tx bank send plmnt12dxmldspdegn3uf2xmfjf95vvsjed7hz9c22ez plmnt1kp93kns6hs2066d8qw0uz84fw3vlthewt2ck6p 1000plmnt --fees 1plmnt -y --keyring-backend test -a 0 -s 3 --offline
planetmint-god tx bank send plmnt12dxmldspdegn3uf2xmfjf95vvsjed7hz9c22ez plmnt15wrx9eqegjtlvvx80huau7rkn3f44rdj969xrx 1000plmnt --fees 1plmnt -y --keyring-backend test -a 0 -s 4 --offline

sleep 5

planetmint-god tx machine attest-machine '{"name": "R2D2", "ticker": "r2d2_ticker", "domain": "testnet-assets.rddl.io", "issued": 1, "amount": 1000, "precision": 8, "type": 1, "issuerPlanetmint": "pmpb7jnWimKoy3oX1FHfmtp8Qh76yRfWuXfmr35dUiStXjSpyTnJ9oqFLBJYHc3q3GM2PpLYJBdXEn4imMxgumpqk7rg9B4J7cMyrm4eSEVAChB", "issuerLiquid": "xpub661MyMwAqRbcGtZqV96pr1WhWExuMC9HZbFDgwaEfmeHiyjbMvnbjScHCsXGgRcRsAL4PVUz4KK4r771mdfHTjSmYsfvxAfvGvMbHbW4xGj", "machineId": "03c4d4ebad52b77574b467b23e35241a610e2ca8176c099461608265a2e74c53df", "address": "plmnt1kp93kns6hs2066d8qw0uz84fw3vlthewt2ck6p", "machineIdSignature": "0f5e74348bdf1726272b02e0855b07edfae9b3569d3c22b7efe6008a0020e7632ed6472b362afbebbad6976f7de6c9cee2905268acab80d3d9ed52f5393d73ea", "metadata": {"additionalDataCID": "CID", "gps": "{\"Latitude\":\"-48.876667\",\"Longitude\":\"-123.393333\"}"}}' --from r2d2 --fees 1plmnt -y --keyring-backend test -a 10 -s 0 --offline 
planetmint-god tx machine attest-machine '{"name": "C3PO", "ticker": "c3po_ticker", "domain": "testnet-assets.rddl.io", "issued": 1, "amount": 1000, "precision": 8, "type": 1, "issuerPlanetmint": "pmpb7jnWimKoy3oX1J4NBpj1t82Wy3JWKnWK75UGwwSofUShEfRrDr58S6JN8KCvh7ednw9WnBULS3WfxF6UUX3wYFwy2SZMqkmV8UtMVsc7wb9", "issuerLiquid": "xpub661MyMwAqRbcGwLXu51iKSS7VrbtmSyppddsAAa9oWe9zBP9Ry2UqMc73agNLGv3GH92sVKoFam22zEoLNtPFsY4S9AzgK5RYeBJMHVwneC", "machineId": "03eb685b107bfa421005e48c7d15dbb1fc9579b0ce60e5ec67696c30de57cf2ca3", "address": "plmnt15wrx9eqegjtlvvx80huau7rkn3f44rdj969xrx", "machineIdSignature": "8f5e64d5f43e3dabe097e564497e684b84c8a8777cce008f170307acbd65d4635b61801b554909678f8fcd84fe3f5609736aeea82aa6531c957d34949fc404d6", "metadata": {"additionalDataCID": "CID", "gps": "{\"Latitude\":\"-48.876667\",\"Longitude\":\"-123.393333\"}"}}' --from c3po --fees 1plmnt -y --keyring-backend test -a 11 -s 0 --offline

sleep 5

planetmint-god tx machine mint-production 100kWs -y --from r2d2 --fees 1plmnt --keyring-backend test -a 10 -s 1 --offline
planetmint-god tx bank send plmnt1kp93kns6hs2066d8qw0uz84fw3vlthewt2ck6p plmnt15wrx9eqegjtlvvx80huau7rkn3f44rdj969xrx 50kWs -y --fees 1plmnt --keyring-backend test -a 10 -s 2 --offline
planetmint-god tx machine burn-consumption 50kWs -y --from c3po --fees 1plmnt --keyring-backend test -a 11 -s 1 --offline