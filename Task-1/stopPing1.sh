#!/bin/bash

# kill and remove created containers
docker kill Client1 Client2 && docker rm Client1 Client2

# shutdown and remove created networks net1/net2
docker network rm net1

echo "Network removed. Containers killed and removed"
