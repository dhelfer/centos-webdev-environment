#!/bin/bash

export GOPATH="${HOME}/go"


#
# Install Ansible
#
yum install ansible.noarch


#
# Prepare Ansible Playbooks
#
#sudo ansible-galaxy install -r ansible-playbooks.requirements.txt --force


#
# Run Playbook
#
ansible-playbook main.yml --skip-tags "instance" -i inventory -e "user=`whoami`" --ask-become-pass
