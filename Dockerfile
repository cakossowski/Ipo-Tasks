FROM ubuntu 

RUN apt-get -y update && apt-get upgrade -y && apt-get install -y \
curl \
wget \
telnet \
dnsutils \
net-tools \
netcat-openbsd \
traceroute \
nmap \
python3 \
python3-pip \
virtualenv \
inetutils-ping \
iproute2 \
iptables \
make \
tcpdump 

CMD bash
