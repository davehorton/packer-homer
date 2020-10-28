#!/bin/bash

if [ ! -z "$1" ]; then return;  fi

sudo apt-get install -y apt-transport-https
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get update 
sudo apt-get install -y influxdb kapacitor telegraf chronograf
sudo cp /tmp/telegraf.conf /etc/telegraf/telegraf.conf
sudo systemctl start telegraf
sudo systemctl start influxdb
sudo systemctl start kapacitor
sudo systemctl start chronograf

sudo systemctl enable influxdb
sudo systemctl enable kapacitor
sudo systemctl enable chronograf

sudo systemctl restart telegraf
