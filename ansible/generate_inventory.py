#!/usr/bin/env python3
import json
import yaml

# Читаем JSON из Terraform
with open('/root/terraform/terraform-openstack/inventory.json') as f:
    data = json.load(f)

inventory = {
    'all': {
        'vars': {
            'ansible_user': 'root',
            'ansible_ssh_private_key_file': '~/.ssh/id_rsa',
            'ansible_ssh_common_args': '-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
        },
        'hosts': {}
    }
}

for vm in data:
    inventory['all']['hosts'][vm['name']] = {
        'ansible_host': vm['ip']
    }

# Сохраняем inventory.yml
with open('inventory.yml', 'w') as f:
    yaml.dump(inventory, f, sort_keys=False)
