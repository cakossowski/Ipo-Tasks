# Solution to Task 3 "Transfer Network"

Ping over a transfer network between C and D from A to B (A-C-D-B). There is no knowledge about the transfer network in A or B

## How does the script work?

Each container and network (and their relationship between each one) are configured within in docker-compose.yml file.
Containers are created with the cap-add NET_ADMIN and the ubuntu-ping image.
Networks are all of type BRIDGE.



```mermaid
---
title: Task 3
---
classDiagram

    Client1 <-- Transfer1
    Transfer1 <--> Transfer2
    Transfer2 --> Client2
    
    Client1 : image "ubuntu-ping" from dockerfile
    Client1 : IP-Address "172.27.0.2"
    Client1 : Network net1

    Client2 : image "ubuntu-ping" from dockerfile
    Client2 : IP-Address "172.26.0.2"
    Client2 : Network net2

    Transfer1 : image "ubuntu-ping" from dockerfile
    Transfer1 : IP-Address "172.27.0.3  //  172.25.0.3"
    Transfer1 : Network net1 & transfernet1
    
    Transfer2 : image "ubuntu-ping" from dockerfile
    Transfer2 : IP-Address "172.26.0.3 // 172.25.0.2"
    Transfer2 : Network net2 & transfernet1



```
