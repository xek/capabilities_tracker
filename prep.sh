#!/bin/bash

# For the OOO undercloud

source stackrc

openstack server list -f value -c Networks | cut -d= -f2 > hosts

ansible-playbook -i hosts stap.yaml

cat capabilities-*.log
