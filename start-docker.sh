#!/usr/bin/env bash

# 开启树莓派4eth0 1935端口

sudo iptables -I INPUT -i eth0 -p tcp --dport 1935 -j ACCEPT
sudo iptables  -I OUTPUT -o eth0 -p tcp --sport 1935 -j ACCEPT


# 开启树莓派4无线网卡1935端口
sudo iptables -I INPUT -i wlan0 -p tcp --dport 1935 -j ACCEPT
sudo iptables  -I OUTPUT -o wlan0 -p tcp --sport 1935 -j ACCEPT

docker stop nginx-rtmp
docker rm   nginx-rtmp

docker run -d -p 1935:1935 --name nginx-rtmp ascs/nginx-rtmp:armv7-stretch
