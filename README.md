# Solution to Task 1 "Ping A to B"

General hints:

- Machines need to be either a VM or docker container
- Script is need to create the setup, create and test network traffic, remove setup again
- No "manual" actions
- Scripts need to be stored in revision control system
- Documentation of every setup needed

```mermaid
---
title: Task 1
---
classDiagram
    note "Containers created with Docker"
    Container_A(Client 1) -- Container_B(Client 2)
    Container_A(Client 1) : image "ubuntu-ping" from dockerfile
    Container_A(Client 1) : IP 123.123.123.123 Port 80 eth0
    Container_B(Client 2) : image "ubuntu-ping" from dockerfile
    Container_B(Client 2) : IP 123.123.123.123 Port 80 eth1



```
