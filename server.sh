#!/bin/bash

CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')
MEM=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')

cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>Server Monitor Dashboard</title>
<meta http-equiv="refresh" content="5">
</head>
<body>
<h1>Server Monitoring Dashboard</h1>
<p><strong>CPU Usage:</strong> $CPU</p>
<p><strong>Memory Usage:</strong> $MEM %</p>
</body>
</html>
EOF
