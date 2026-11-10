#!/usr/bin/env bash
setup(){
	sudo apt update
	sudo apt install ansible -y
	ansible --version 
}

setup
