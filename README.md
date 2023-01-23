# Explanation for Repository


Tasks are given during first practical phase of the three-year dual course of study (computer science)

## General hints:

- Machines need to be either a VM or docker container
- Script is need to create the setup, create and test network traffic, remove setup again
- No "manual" actions
- Scripts need to be stored in revision control system
- Documentation of every setup needed (with an image)

## Tasks
ping from A to B (A-B)
ping over a router C from A to B (A-C-B)
ping over a transfer network between C and D from A to B (A-C-D-B). There is no knowledge about the transfer network in A or B
ping over two transfer networks from A to B (A-C-E-D-B). No knowledge about the transfer networks in A or B
ping over a redundant mesh from a to B (A-C-E1,E2-D-B), power off E1 and/or E2, handle the fail-over manually with a script
configure the last step with dynamic routing, there should be no fail-over script necessary
