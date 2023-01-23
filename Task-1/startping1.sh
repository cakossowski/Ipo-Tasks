#!/bin/bash

# create network needed for task-1
docker network create net1

# create containers Client1, Client2
docker run -itd --privileged --net net1 --name Client1 ubuntu-ping bash
docker run -itd --privileged --net net1 --name Client2 ubuntu-ping bash

# get IP-Addresses of each container in their respective network
c1_net1=$(docker container inspect Client1 --format "{{ .NetworkSettings.Networks.net1.IPAddress }}")
c2_net1=$(docker container inspect Client2 --format "{{ .NetworkSettings.Networks.net1.IPAddress }}")


# change settings for each container to change default gateway
docker exec -it Client1 ip route replace default via $c2_net1
docker exec -it Client2 ip route replace default via $c1_net1

# show flow with traceroute and ping for Client 1
echo "------- Client 1 to Client 2 -------"
docker exec -it Client1 traceroute $c2_net1
docker exec -it Client1 ping -c 2 $c2_net1

# show flow with traceroute and ping for Client 2
echo "------- Client 2 to Client 1 -------"
docker exec -it Client2 traceroute $c1_net1
docker exec -it Client2 ping -c 2 $c1_net1
