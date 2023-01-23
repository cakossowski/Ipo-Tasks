# Solution to Task 1 "Ping A to B"

General task:

Ping from A to B (A-B)


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
