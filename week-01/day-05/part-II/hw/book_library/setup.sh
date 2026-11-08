#!/usr/bin/env bash
set -Eeuo pipefail

LOG="/vagrant/deploy_logs.txt"

exec > >(tee -a "$LOG") 2>&1

install_dependencies(){
	echo "Installing dependencies..." | tee -a $LOG
	sudo apt update
	sudo apt install -y python3 python3-pip python3-venv nginx git curl
}

clone_app() {
	echo "Cloning app..." | tee -a $LOG
	cd /home/vagrant
	git clone -b booklibrary https://github.com/roxsross/devops-static-web.git
	cd devops-static-web
}

setup_app() {
	echo "Setting up app.." | tee -a $LOG
	python3 -m venv venv
	source venv/bin/activate
	
	pip install -r requirements.txt
	pip install gunicorn
}

start_gunicorn() {
	echo "Installing gunicorn" | tee -a $LOG
	nohup venv/bin/gunicorn \
		-w 2 \
		-b 127.0.0.1:8000 \
		library_site:app \
		>> $LOG 2>&1 &
	sleep 3
}

setup_nginx() {
  echo "Setting up Nginx..." | tee -a $LOG

  rm -f /etc/nginx/sites-enabled/default

  cat > /etc/nginx/sites-available/booklibrary <<EOF
server {
    listen 80;

    location / {
        proxy_pass http://127.0.0.1:8000;
    }
}
EOF

  ln -sf \
    /etc/nginx/sites-available/booklibrary \
    /etc/nginx/sites-enabled/booklibrary

  systemctl restart nginx
}

verify() {
  echo "Verifying..." | tee -a $LOG

  curl http://127.0.0.1:8000
}


install_dependencies
clone_app
setup_app
start_gunicorn
setup_nginx
verify
