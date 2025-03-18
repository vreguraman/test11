ansible-galaxy role init ec2
openssl rand -base64 2048 > vault.pass
ansible-vault create group_vars/all/pass.yml --vault-password-file vault.pass
ansible-vault edit group_vars/all/pass.yml --vault-password-file vault.pass

ec2_create.yaml 
---
- hosts: localhost
  connection: local
  roles:
    -  ec2

ec2/tasks/main.yml

---
- name: start an instance with a public IP address
  amazon.aws.ec2_instance:
    name: "public-compute-instance"
      #key_name: "prod-ssh-key"
      #vpc_subnet_id: subnet-5ca1ab1e
    instance_type: "{{ ins_type }}"
    security_group: default
    network_interfaces:
      - assign_public_ip: true
    image_id: "{{ ami_id }}"
    region: us-east-1
    aws_access_key: "{{ aws_access_key }}"  # From vault as defined
    aws_secret_key: "{{ aws_secret_key }}"  # From vault as defined      
    tags:
      Environment: Testing
