#!/bin/bash
#WATCH_DIR=$(pwd)/tomcat/webapps
WATCH_DIR='/usr/local/apache*/webapps'
WAR_NAME=ROOT.war
SLEEP=1
console () {
  echo >&2 $1
  # return 0
}

count_war () {
  echo $( lsof +D $WATCH_DIR | grep $WAR_NAME | awk '{print  $9}' |  wc -l )
}

listen_for_uploading_war () {
  let cnt=$(count_war)
  while [ $cnt -eq 0 ]
  do
    cnt=$(count_war)
    # console "no war: $cnt files"
    sleep $SLEEP
  done
  console "found new file "
  echo  $WATCH_DIR/$WAR_NAME
}

wait_for_uploaded () {
  let cnt=$(count_war)
  while [ $cnt -ne 0 ]
  do
    console "now uploading($cnt files)..."
    cnt=$(count_war)
    sleep $SLEEP
  done
}

CONTAINER_TC_PATH=/usr/local/tomcat
TCS=(tc01 tc02)
deploy () {
    local warfile=$1
    console "[DEPLOYING] $warfile"
    for tc in ${TCS[*]}
    do
      #printf "=> %s\n" $tc
      docker cp $warfile $tc:$CONTAINER_TC_PATH/webapps/$WAR_NAME
      printf "[DONE:$tc] to %s\n" $tc
    done
}
rename () {
   mv $1 $1.save
   console "[RENAME] $1 TO $1.save"
}
# main
let wfile
while true
do
    console "start"
    wfile=$(listen_for_uploading_war)
    console "[DETECTED] $wfile"
    wait_for_uploaded $warfile
    console "[UPLODED] $wfile"
    deploy $wfile
    rename $wfile
done
console "done"
