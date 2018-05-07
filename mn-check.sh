#!/bin/bash



#set -x

MN="Masternode-1"
MNVIN="<VIN TX>"
sentime=`stat -c %Y $HOME/sentinel/sentinel-cron.log`
nowtime=`date -d "now - 2 hours"  +%s`



##
## Check if paccoin daemon works
##
if [  `ps ax | grep -v grep | grep paccoind | wc -l` -ne 1 ]
then
  echo paccoind-not-running on $MN
fi

##
## Check if MASTERNODE is in state enabled
##
if [  `$HOME/paccoin-cli  masternode list |grep $MNVIN|grep -vw ENABLED|wc -l` -gt 0 ] 
then
        echo Masternode-not-status-enabled $MN

fi


##
## Check if sentinel log changed recently
##
if [ "$sentime" -gt "$nowtime" ]; then
    echo sentinel-log-changed on $MN
fi
