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
    note "Containers created with Docker // in same network pingBridge1 connected through eth0"
    Container_C1 -- Container_C2
    Container_C1 : image "ubuntu-ping" from dockerfile
    Container_C1 : IP 123.123.123.123 Port 80 eth0
    Container_C2 : image "ubuntu-ping" from dockerfile
    Container_C2 : IP 123.123.123.123 Port 80 eth1



```
