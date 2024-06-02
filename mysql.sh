source common.sh
rm -f /tmp/expense.log

if [ -z "$1" ]; then
  echo "INput MySQL Password is Missing"
  exit 1
fi

Heading Installing MySQL Server
dnf install mysql-server -y &>>/tmp/expense.log
Stat $?

Heading Start Nginx Service
systemctl enable mysqld &>>/tmp/expense.log
systemctl start mysqld &>>/tmp/expense.log
Stat $?

Heading Set Root Password
mysql_secure_installation --set-root-pass $1 &>>/tmp/expense.log
Stat $?
