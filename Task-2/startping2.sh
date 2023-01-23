#!/bin/bash

# create networks needed for task-2
docker network create --driver=bridge --subnet=1.1.1.0/16 net1
docker network create --driver=bridge --subnet=1.1.1.50/16 net2

# create containers Client1, Client2 and Router1
docker run -itd --privileged --net net1 --name Client1 --ip 1.1.1.1 ubuntu-ping bash
docker run -itd --privileged --net net1 --name Router1 --ip 1.1.1.5 ubuntu-ping bash
docker run -itd --privileged --net net2 --name Client2 --ip 1.1.1.2 ubuntu-ping bash

# add router Router1 to remaining network
docker network connect net2 R1

# change settings for each container to change default gateway
docker exec -it Client1 ip route replace default via 1.1.1.5
docker exec -it Client2 ip route replace default via 1.1.1.5

# show flow with traceroute and ping for Client 1
echo "------- Client 1 to Client 2 -------"
docker exec -it Client1 traceroute 1.1.1.2
docker exec -it Client1 ping -c 2 1.1.1.2

# show flow with traceroute and ping for Client 2
echo "------- Client 2 to Client 1 -------"
docker exec -it Client2 traceroute 1.1.1.1
docker exec -it Client2 ping -c 2 1.1.1.1
