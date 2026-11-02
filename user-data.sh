#!/bin/bash

dnf install -y nginx

cat > /usr/share/nginx/html/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head>
    <title>My AWS Website</title>
</head>
<body>
    <h1>Hello from AWS EC2!</h1>
    <p>I deployed this website using an automated startup script.</p>
</body>
</html>
HTML

systemctl enable nginx
systemctl start nginx
