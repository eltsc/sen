import json
import os
from jinja2 import Template
import subprocess
import sys

ftp_name, db_name, nginx_name, tester_name = "","","","tester"
tags = "hostname"

# get the real name of the servers
with open('terraform/terraform.tfvars', 'r') as ter:
    for line in ter.readlines():
        if "ftp_name" in line:
            ftp_name = line.split('"')[1]
        elif "nginx_name" in line:
            nginx_name = line.split('"')[1]
        elif "db_name" in line:
            db_name = line.split('"')[1]

# create inventory file with servers name's and IPs
with open('ansible/inventory.yaml' , 'w') as f:
    with open('terraform/terraform.tfstate') as json_file:
        data = json.load(json_file)
        for res in data["resources"]:
            if res["type"] == "vcd_vapp_vm":
                for instance in res["instances"]:
                    compuet_name = instance["attributes"]["computer_name"]
                    if compuet_name == ftp_name:
                        tags += ", ftp" 
                    elif compuet_name == nginx_name:
                        tags += ", nginx" 
                    elif compuet_name == db_name:
                        tags += ", mysql"
                    f.write("[" + compuet_name + "]\n" + instance["attributes"]["network"][0]["ip"] + "\n")

# render ansible playbook
with open('ansible/playbook.yaml.j2') as file:
    template = Template(file.read())
with open('ansible/playbook.yaml' , "w") as f:
    f.write(template.render(ftp_name=ftp_name, nginx_name=nginx_name, mysql_name=db_name, tester_name=tester_name))

print(tags)
# run ansible
# os.popen("ansible-playbook -i ansible/inventory.yaml --tags '{0}' ansible/playbook.yaml ".format(tags)).read()
