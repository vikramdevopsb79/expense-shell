 a=6
 b=5
 echo a is $a
 echo b is ${b}
 echo -e "\e[32m helloworld\e[0m"
 #system variables
  echo exit - $?
  echo script name - $0
  echo first argument - $1
  echo second argument - $2
  echo all argument - $*
  echo no.of arguments - $#
LS=$(ls)
echo LS
add=$((a+b))
echo $add

print_hello() {
  echo no.of arguments - $#
  echo a is $a
  echo First argument - $1
  echo second argument - $2
}

print_hello 1 2 3

demo() {
  echo helloworld
  return 5
  echo bye
}
#This demonstrates that $? is used to get the exit status of the last executed command, which can be any integer value (not just 0).
demo
echo return status of function - $?
if [ $a -gt 5 ]; then
  echo $a is big  so it satisfiers
  elif [ $b -gt 7 ]; then
     echo $b is big so it satisfiers
fi
i=10
while [ $i -gt 0 ]; do
  i=$((i-1))
  sleep 2
  done
for course in devops aws azure ; do
  echo welcome  $course  training
  done
