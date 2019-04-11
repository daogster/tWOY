#!/bin/sh

# Change the following address to your BTM addr.
ADDRESS=bm1q4fcqllxe0k05utju0r8uyd9ysm3y8tdu6al6ta

USERNAME=$ADDRESS.w
POOL=btm.f2pool.com:9221
SCHEME=tensority

./bminer -uri $SCHEME://$USERNAME@$POOL -api 127.0.0.1:1880
