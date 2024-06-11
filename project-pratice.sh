stat() {
  if [ $1 -eq 0 ]; then
    echo SUCCESS
   else
     echo Failure
     exit 2
  fi
}
heading() {
  echo -e "\e[32m$*\e[0m"
}

heading installing nginx
dnf install nginx -y &>>/tmp/expense.log
stat $?
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
rm -rf /usr/share/nginx/html/*
stat $?
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>/tmp/expense.log
stat $?
systemctl status enable nginx
systemctl status restart nginx
#need to know more about reverse proxy
# to know service name systemctl list-units --type=service | grep nginx
#Using systemctl commands like enable, start, restart, and status allows you to manage systemd services

#Enable: Use when you want Nginx to start on boot.
#Start: Use when you want to start Nginx immediately.
#Restart: Use when you want to stop and start Nginx to apply configuration changes.
#Status: Use when you want to check if Nginx is running or to troubleshoot.
#Reload: Use when you want to apply configuration changes without stopping the service.
#Stop: Use when you need to stop Nginx immediately.
#When you use systemctl enable for a service like Nginx, you are instructing the system to start this service automatically during the bootup process. This ensures that the service is available and running without requiring manual intervention each time the system starts.

#if [ -z "$1" ]; then
#  echo input password is missing in sql
#  fi
#  mysql -h 172.31.23.215 -uroot -p$1 < /app/schema/backend.sql
#  mysql_secure_installation --set-root-pass $1
#
#cat sample | grep ^a
#cat sample | grep a$
#
#cat sample | grep -E p\{2}
#cat sample | grep "a\+t"
#echo a{0..9}b
#
#Active directory or ldap centralised identity for employee who joins org single sign on
