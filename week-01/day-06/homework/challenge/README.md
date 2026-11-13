# Day 6 — Ansible Challenge

Part of the **90 Days of DevOps with Roxs** challenge.

## Overview

Automated Ubuntu 24.04 server setup using Vagrant and Ansible.

- Install Nginx and deploy a custom landing page.
- Create a `devops` user with sudo and SSH access.
- Configure UFW (ports 22, 80, 443).
- Organize configuration using Ansible roles.
- Automate provisioning with Vagrant.

## Requirements

- Vagrant
- VirtualBox
- Ansible

```bash
ansible-galaxy collection install community.crypto ansible.posix community.general
```

## Usage

```bash
mkdir -p .keys
vagrant up
```

Access the landing page at http://localhost:8083.

Re-run provisioning:

```bash
vagrant provision
```

Destroy the VM:

```bash
vagrant destroy -f
```

## Project Structure

- `inventories/` — Host configuration
- `roles/nginx/` — Web server setup
- `roles/devops/` — User and SSH configuration
- `roles/firewall/` — UFW rules
- `playbook.yml` — Main Ansible playbook
- `Vagrantfile` — VM configuration and provisioning
