#!/bin/bash

set -e

deploy() {
  local warf=$1
  mv $warf  ${warf}.save
  echo "#0 is $0"
  echo "renamed $1"
}

# export function as environment value
export -f deploy

TC_PATH=$(pwd)/tomcat
#TC_PATH=/usr/local/apache-tomcat-8.5.32
TS_FILE=$TC_PATH/webapps/timestamp

while true
do
    touch  $TS_FILE
    sleep 2
    find  $TC_PATH/webapps -cnewer $TS_FILE -name ROOT.war \
          -exec bash -c 'deploy "$1"' _ {} \;
    echo $(date)
done
