#!/bin/bash

# create networks needed for task-2
docker network create --driver=bridge --subnet=1.1.1.0/16 netz1
docker network create --driver=bridge --subnet=1.1.1.50/16 netz2

# create containers C1, C2 (Clients) and R1 (Router)
docker run -itd --privileged --net netz1 --name Client1 --ip 1.1.1.1 ubuntu-ping bash
docker run -itd --privileged --net netz1 --name Router1 --ip 1.1.1.5 ubuntu-ping bash
docker run -itd --privileged --net netz2 --name Client2 --ip 1.1.1.2 ubuntu-ping bash

# add router R1 to remaining network
docker network connect netz2 R1


# change settings for each container to change default gateway
