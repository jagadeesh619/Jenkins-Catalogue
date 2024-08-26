#!/bin/bash
component=$1
environment=$2 #dont use env here, it is reserved in linux
appversion=$3
yum install ansible -y
# git clone https://github.com/jagadeesh619/devops-ansible.git
ansible-pull -U https://github.com/jagadeesh619/ansible-roboshop-tf.git -e component=$component -e env=$environment appversion=$appversion main.yaml