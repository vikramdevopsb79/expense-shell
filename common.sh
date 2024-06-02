Heading() {
  echo -e "\e[36m$*\e[0m"
}
Stat(){
  if [ $1 -eq 0 ]; then
    echo SUCCESS
    else
      echo FAILURE
      exit 2
    fi
}