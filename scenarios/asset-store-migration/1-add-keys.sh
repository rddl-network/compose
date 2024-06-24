#!/bin/bash

mnemonic="helmet hedgehog lab actor weekend elbow pelican valid obtain hungry rocket decade tower gallery fit practice cart cherry giggle hair snack glance bulb farm"

echo $mnemonic | planetmint-god keys add machine --recover --keyring-backend test
