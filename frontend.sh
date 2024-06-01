dnf install nginx -y
# here it placed because we are switching directory at end
cp expense.conf /etc/nginx/default.d/expense.conf

systemctl start nginx
rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd  /usr/share/nginx/html
unzip /tmp/frontend.zip

systemctl restart nginx
systemctl enable nginx
