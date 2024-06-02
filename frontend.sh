source common.sh
rm -f /tmp/expense.log
Heading Installing Nginx
dnf install nginx -y &>> /tmp/expense.log
Stat $?
Heading copying conf file in frontend
cp expense.conf /etc/nginx/default.d/expense.conf &>>//tmp/expense.log
Stat $?
Heading  remove old content
rm -rf /usr/share/nginx/html/* &>> /tmp/expense.log
Stat $?
Heading downloading content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>//tmp/expense.log
Stat $?
cd  /usr/share/nginx/html &>> /tmp/expense.log
Heading unzipping downloaded content
unzip /tmp/frontend.zip &>> /tmp/expense.log
Stat $?
 Heading restart service
systemctl restart nginx &>> /tmp/expense.log
systemctl enable nginx &>> /tmp/expense.log
