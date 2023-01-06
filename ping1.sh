#!/bin/bash

docker run -itd --name Container_A  -p 8001:80 ubuntu-ping
echo "Container_A erstellt"
sleep 3

docker run -itd --name Container_B  -p 8002:80 ubuntu-ping
echo "Container_B erstellt"
sleep 3

docker ps
sleep 5

docker network create pingBridge1
echo "Netzwerk pingBridge1 erstellt"
sleep 3

docker network connect pingBridge1 Container_A
docker network connect pingBridge1 Container_B
echo "Verbindung Container_A und Container_B zu Bridge1 hergestellt"
sleep 3

docker network inspect pingBridge1
sleep 5


docker exec -it Container_A ping -c 3 Container_B
docker exec -it Container_B ping -c 3 Container_A
echo "Ping von A zu B durchgeführt, Reversiver Ping auch durchgeführt"
sleep 3

docker stop Container_A Container_B
docker rm   Container_A Container_B
docker network rm pingBridge1
echo "Container und Netzwerk heruntergefahren und entfernt"

echo "Test für neue Version - git push"
