# $PAC Masternode Health Check


### Install required software
```
sudo apt-get update
sudo apt-get install curl python-pip -y
sudo pip install --upgrade setuptools
sudo pip install pushbullet-cli
```

### Install
download the script, edit your <VIM TX> number...
  

### enter your pushullet API KEY
```
pb set-key
```

### Add Crontab to check every 15min
```
$crontab -e
*/15 * * * * /usr/local/bin/mn-check.sh
```
