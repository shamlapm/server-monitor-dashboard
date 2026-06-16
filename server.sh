#!/bin/bash

CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.2f%%", usage}')
MEM=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2}')
DISK=$(df -h / | awk 'NR==2 {print $5}')
NGINX_STATUS=$(curl -s http://localhost/nginx_status | head -n 1)

cp index.html /tmp/index.html

sed -i "s|CPU_PLACEHOLDER|$CPU|g" /tmp/index.html
sed -i "s|MEM_PLACEHOLDER|$MEM|g" /tmp/index.html
sed -i "s|DISK_PLACEHOLDER|$DISK|g" /tmp/index.html
sed -i "s|NGINX_PLACEHOLDER|$NGINX_STATUS|g" /tmp/index.html

sudo cp /tmp/index.html /var/www/html/index.html
sudo cp style.css /var/www/html/style.css
sudo cp script.js /var/www/html/script.js
