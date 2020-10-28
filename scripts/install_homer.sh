#!/bin/bash
DB_USER=$1
DB_PASS=$2

curl -s https://packagecloud.io/install/repositories/qxip/sipcapture/script.deb.sh | sudo bash
sudo apt-get install -y homer-app heplify-server

sudo sed -i -e "s/homer_user/$DB_USER/g" /usr/local/homer/etc/webapp_config.json
sudo sed -i -e "s/homer_password/$DB_PASS/g" /usr/local/homer/etc/webapp_config.json
sudo homer-app -create-table-db-config 
sudo homer-app -populate-table-db-config
sudo sed -i -e "s/DBUser\s*=\s*\"postgres\"/DBUser          = \"$DB_USER\"/g" /etc/heplify-server.toml
sudo sed -i -e "s/DBPass\s*=\s*\"\"/DBPass          = \"$DB_PASS\"/g" /etc/heplify-server.toml
sudo sed -i -e "s/PromAddr\s*=\s*\"\"/PromAddr        = \"0.0.0.0:9096\"/g" /etc/heplify-server.toml

sudo systemctl enable homer-app
sudo systemctl restart homer-app
sudo systemctl status homer-app

sudo systemctl enable heplify-server
sudo systemctl restart heplify-server
sudo systemctl status heplify-server
