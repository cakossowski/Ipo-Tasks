# Solution to Task 1 "Ping A to B"

General hints:

- Machines need to be either a VM or docker container
- Script is need to create the setup, create and test network traffic, remove setup again
- No "manual" actions
- Scripts need to be stored in revision control system
- Documentation of every setup needed

```mermaid
classDiagram
<<Dockercontainer>> ContainerA
ContainerA : IP: XXX.XXX.XXX.XXX Port XX
ContainerA : Image ubuntu-ping

ContainerA <--> ContainerB : Verbindung via eth0 und Netzwerk pingBridge1

```
