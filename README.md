## $PAC Masternode Health Check

Small tool which checks your masternode health, and send a [pushullet](https://www.pushbullet.com/) notification on your mobile, if:
* paccoind stops working
* Masternode is not in `ENABLE` state anymore
* Sentinel Log has new entries (it shouldn't)
* Disk Space in use is higher than 75%



### Install required software
```
sudo apt-get update
sudo apt-get install curl python-pip -y
sudo pip install --upgrade setuptools
sudo pip install pushbullet-cli
```

### Install
```
$ wget https://raw.githubusercontent.com/foxrtb/pac-masternode-check/master/mn-check.sh
$ chmod +x mn-check.sh
$ sudo cp mn-check.sh /usr/local/bin/
```
edit the file and change  <VIM TX> number...
  

### enter your pushullet API KEY 
get it from https://www.pushbullet.com/  accunt-> Access Tokens
```
pb set-key
```

### Add Crontab to check every 15min
```
$crontab -e
*/15 * * * * /usr/local/bin/mn-check.sh
```
