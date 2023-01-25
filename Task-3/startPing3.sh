#!/bin/bash

# create networks needed for task-3
docker network create net1
docker network create transferNet1
docker network create net2

# create containers Client1, Client2, Transfer1 and Transfer2
docker run -itd --cap-add NET_ADMIN --name Client1 ubuntu-ping bash
docker run -itd --cap-add NET_ADMIN --name Transfer1 ubuntu-ping bash
docker run -itd --cap-add NET_ADMIN --name Transfer2 ubuntu-ping bash
docker run -itd --cap-add NET_ADMIN --name Client2 ubuntu-ping bash

# add router Router1 to remaining network
docker network connect net1 Client1
docker network connect net1 Transfer1
docker network connect transferNet1 Transfer1
docker network connect transferNet1 Transfer2
docker network connect net2 Client2
docker network connect net2 Transfer2


# get IP-Addresses of Router1 in networks as variables for further use
r1_net1=$(docker container inspect Router1 --format "{{ .NetworkSettings.Networks.net1.IPAddress }}")
r1_net2=$(docker container inspect Router1 --format "{{ .NetworkSettings.Networks.net2.IPAddress }}")

# get IP-Addresses of each container in their respective network
c1_net1=$(docker container inspect Client1 --format "{{ .NetworkSettings.Networks.net1.IPAddress }}")
c2_net2=$(docker container inspect Client2 --format "{{ .NetworkSettings.Networks.net2.IPAddress }}")


# change settings for each container to change default gateway
docker exec -it Client1 ip route replace default via $r1_net1
docker exec -it Client2 ip route replace default via $r1_net2

# show flow with traceroute and ping for Client 1
echo "------- Client 1 to Client 2 -------"
docker exec -it Client1 traceroute $c1_net1
docker exec -it Client1 ping -c 2 $c1_net1

# show flow with traceroute and ping for Client 2
echo "------- Client 2 to Client 1 -------"
docker exec -it Client2 traceroute $c2_net2
docker exec -it Client2 ping -c 2 $c2_net2
