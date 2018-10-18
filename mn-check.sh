#!/bin/bash



#set -x

MN="Masternode-1"
MNVIN="<vim tx number>"
#sentime=`stat -c %Y $HOME/sentinel/sentinel-cron.log`
#nowtime=`date -d "now - 30 minutes"  +%s`
DISKSPACE=`df -h /dev/vda1 | awk '{ print $5 }' | tail -n 1| cut -d'%' -f1`


##
## Check if paccoin daemon works
##
if [  `ps ax | grep -v grep | grep paccoind | wc -l` -ne 1 ]
then
         /usr/local/bin/pb push "paccoind not running on $MN"
fi

##
## Check if MASTERNODE is in state enabled
##
if [  `$HOME/paccoin-cli  masternode list |grep $MNVIN|grep -vw ENABLED|wc -l` -gt 0 ]
then
        /usr/local/bin/pb push "MN not in status ENABLED on $MN" 

fi

##
## Check if fdisk usage is bigger than 75%
##
if [ $DISKSPACE -gt 75 ]
then
/usr/local/bin/pb push "Disk Space on $MN is $DISKSPACE% in use"
fi

##
## Check if sentinel log changed recently
##
##if [ "$sentime" -gt "$nowtime" ]; then
##    /usr/local/bin/pb push "Sentinel-cron log changed  on $MN"             
##fi
