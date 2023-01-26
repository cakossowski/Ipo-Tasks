#!/bin/bash

# create infrastructer (4 containers [Client1, Client2, Transfer1, Transfer2] and 3 networks [net1, net2, transfernet1]) needed for task-3
# docker compose will also place them in networks as specified in the YML-file
docker compose up -d

# change settings for each container to change default gateway
docker exec -it task-3-Client1-1 ip route replace default via 172.27.0.3
docker exec -it task-3-Transfer1-1 ip route replace default via 172.25.0.2
docker exec -it task-3-Transfer2-1 ip route replace default via 172.25.0.3
docker exec -it task-3-Client2-1 ip route replace default via 172.26.0.3

# show flow with traceroute and ping for Client 1
echo "------- Client 1 to Client 2 -------"
docker exec -it task-3-Client1-1 traceroute 172.26.0.2
docker exec -it task-3-Client1-1 ping -c 2 172.26.0.2

# show flow with traceroute and ping for Client 2
echo "------- Client 2 to Client 1 -------"
docker exec -it task-3-Client2-1 traceroute 172.27.0.2
docker exec -it task-3-Client2-1 ping -c 2 172.27.0.2
