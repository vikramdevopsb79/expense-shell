source common.sh
rm -f /tmp/expense.log

if [ -z "$1" ]; then
  echo "INput MySQL Password is Missing"
  exit 1
fi

Heading "Disable NodeJS default version"
dnf module disable nodejs -y &>>/tmp/expense.log
stat $?

Heading "Enable NodeJS 20"
dnf module enable nodejs:20 -y &>>/tmp/expense.log
stat $?

Heading "Install NodeJS"
dnf install nodejs -y &>>/tmp/expense.log
stat $?

Heading "Add Expense User"
id expense &>>/tmp/expense.log
if [ $? -ne 0 ]; then
  useradd expense &>>/tmp/expense.log
fi
stat $?

Heading "Setup Backend Service"
cp backend.service /etc/systemd/system/backend.service &>>/tmp/expense.log
stat $?

Heading "Delete Existing Application Directory"
rm -rf /app
stat $?

Heading "Create Application Directory"
mkdir /app &>>/tmp/expense.log
stat $?

Heading "Download Backend Code"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>>/tmp/expense.log
stat $?

cd /app

Heading "Extract Backend code"
unzip /tmp/backend.zip &>>/tmp/expense.log
stat $?

Heading "Download NodeJS App Dependencies"
npm install &>>/tmp/expense.log
stat $?

Heading "Install MySQL Client"
dnf install mysql -y &>>/tmp/expense.log
stat $?

Heading "Load Schema"
mysql -h 172.31.23.215 -uroot -p$1 < /app/schema/backend.sql &>>/tmp/expense.log
stat $?

Heading "Start Backend Service"
systemctl daemon-reload
systemctl enable backend
systemctl restart backend
stat $?