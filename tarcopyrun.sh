#!/bin/bash
docker save nginx:newconf > /home/ed/lxtest/tar/nginx.tar
scp -i /home/ed/awspemkeys/id_rsa_ec2.pem /home/ed/lxtest/tar/nginx.tar ubuntu@18.223.123.163:~
sleep 5
scp -i /home/ed/awspemkeys/id_rsa_ec2.pem /home/ed/lxtest/tar/nginx.tar ubuntu@3.144.73.232:~
ansible-playbook runimage.yml


