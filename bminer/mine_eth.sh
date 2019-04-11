#!/bin/sh

# Change the following address to your ETH addr.
ADDRESS=0xb76d43eAaB2e905028a7f0F3aF13C7A84c477B9f

USERNAME=$ADDRESS.w
POOL=eth-us-west1.nanopool.org:9999
# Change SCHEME according to your POOL. For example:
# ethash:     Ethermine, Nanopool
# ethproxy:   F2pool, Sparkpool
# ethstratum: Miningpoolhub
SCHEME=ethash

./bminer -uri $SCHEME://$USERNAME@$POOL -api 127.0.0.1:1880
