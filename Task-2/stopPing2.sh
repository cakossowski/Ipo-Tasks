#!/bin/bash

# shutdown and remove created networks netz1/netz2
docker network rm netz1 && docker network rm netz2

# kill and remove created containers C1, C2 (Clients) and R1 (Router)
docker kill Client1 Client2 Router1 && docker remove Client1 Client2 Router1
