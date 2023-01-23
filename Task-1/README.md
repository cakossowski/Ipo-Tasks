# Solution to Task 1 "Ping A to B"

General task:

Ping from A to B (A-B)


```mermaid
---
title: Task 1
---
classDiagram
    note "Containers created with Docker // in same network net1 (Subnet 1.1.1.0/16)"
    Container_C1 -- Container_C2
    Container_C1 : image "ubuntu-ping" from dockerfile
    Container_C1 : IP 1.1.1.1
    Container_C2 : image "ubuntu-ping" from dockerfile
    Container_C2 : IP 1.1.1.2



```
