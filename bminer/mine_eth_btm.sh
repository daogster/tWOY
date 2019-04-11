#!/bin/sh

# Change the following address to your ETH addr.
ADDRESS=0xb76d43eAaB2e905028a7f0F3aF13C7A84c477B9f

# Change the following address to your BTM addr.
ADDRESS_2=bm1q4fcqllxe0k05utju0r8uyd9ysm3y8tdu6al6ta

USERNAME=$ADDRESS.w
POOL=eth-us-west1.nanopool.org:9999
# Change SCHEME according to your POOL. For example:
# ethash:     Ethermine, Nanopool
# ethproxy:   F2pool, Sparkpool
# ethstratum: Miningpoolhub
SCHEME=ethash

USERNAME_2=$ADDRESS_2.w
POOL_2=btm.f2pool.com:9221
SCHEME_2=tensority

./bminer -uri $SCHEME://$USERNAME@$POOL -uri2 $SCHEME_2://$USERNAME_2@$POOL_2 -api 127.0.0.1:1880
