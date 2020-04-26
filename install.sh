#!/bin/sh 

cd terraform
pwd
terraform12.23 init
terraform12.23 apply
cd ..
python3 ./run-ansible.py