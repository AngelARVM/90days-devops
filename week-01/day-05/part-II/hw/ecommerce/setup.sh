#!/usr/bin/env bash
#!/bin/bash

LOG="/vagrant/logs_pm2.txt"

install_dependencies() {
  echo "Installing dependencies..." | tee -a $LOG

  apt update
  apt install -y nodejs npm git

  npm install -g pm2
}

clone_app() {
  echo "Cloning app..." | tee -a $LOG

  cd /home/vagrant

  git clone -b ecommerce-ms \
    https://github.com/roxsross/devops-static-web.git

  cd devops-static-web
}

install_apps() {
  echo "Installing apps..." | tee -a $LOG

  cd frontend
  npm install
  cd ..

  cd products
  npm install
  cd ..

  cd shopping-cart
  npm install
  cd ..

  cd merchandise
  npm install
  cd ..
}

start_apps() {
  echo "Starting apps..." | tee -a $LOG

  pm2 start frontend/server.js --name frontend
  pm2 start products/server.js --name products
  pm2 start shopping-cart/server.js --name shopping-cart
  pm2 start merchandise/server.js --name merchandise

  pm2 save
}

verify() {

  echo "Verifying..." | tee -a $LOG
  pm2 list
}

install_dependencies
clone_app
install_apps
start_apps
verify
