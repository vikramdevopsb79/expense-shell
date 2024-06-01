dnf install nginx -y
systemctl enable nginx
systemctl restart nginx

rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip

cd /usr/share/nginx/html
unzip frontend.zip
vim /etc/nginx/default.d/expense.conf

systemctl restart nginx

