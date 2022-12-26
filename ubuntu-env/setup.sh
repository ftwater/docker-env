#!/bin/bash
echo "root password is ${ROOT_PASSWORD}"
echo "root:${ROOT_PASSWORD}" | chpasswd
service ssh start
echo "ssh service started"
bash
