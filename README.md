# NginxUbuntu

To launch Nginx in AWS:
-----------------------

set environment variables:
    AWS_ACCESS_KEY_ID="..."
    AWS_SECRET_ACCESS_KEY="..."

cd Terraform

terraform init

terraform apply


To use Ansible solution:
------------------------

cd Ansible

Change parameters in hosts.txt and group_vars/ubuntu_servers

./nginx.yml
