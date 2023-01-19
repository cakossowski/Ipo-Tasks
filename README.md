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
    Container_A *--* Container_B
    Container_A : image "ubuntu-ping" from dockerfile
    Container_A : IP 123.123.123.123 Port 80 eth0
    Container_B : image "ubuntu-ping" from dockerfile
    Container_B : IP 123.123.123.123 Port 80 eth1



```
