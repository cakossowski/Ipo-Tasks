#!/bin/bash

# shutdown and remove created networks net1/net2
docker network rm net1 net2

# kill and remove created containers
docker kill Client1 Client2 Router1 && docker rm Client1 Client2 Router1

echo "Networks removed. Containers killed and removed"
