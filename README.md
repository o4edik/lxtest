
# Task for trainee

##  1. Preparation

### 1.1 Prepare .tf file for create AWS EC2 instances and install docker engine via Terraform

![infra.tf](https://github.com/o4edik/lxtest/blob/main/infra.tf)

### 1.2 Create plain html page

![html](https://github.com/o4edik/lxtest/blob/main/www/index.html)

### 1.3 Create custom nginx docker image with own html page from official nginx dockerimage.

![dockerfile](https://github.com/o4edik/lxtest/blob/main/www/dockerfile)

### 1.4 Create ansible.cfg

![ansible.cfg](https://github.com/o4edik/lxtest/blob/main/ansible.cfg)

### 1.5 Create inventory file for Ansible for managed EC2 nodes

![anshosts.txt](https://github.com/o4edik/lxtest/blob/main/anshosts.txt)

### 1.6 Create Ansible playbook file for running custom dockerimage on AWC EC2 instances

![runimage.yml](https://github.com/o4edik/lxtest/blob/main/runimage.yml)

### 1.7 Create bash script for running full task

![tarcopyrun.sh](https://github.com/o4edik/lxtest/blob/main/tarcopyrun.sh)


##  2.Exec

### 2.1 Run infra.tf for creating AWS EC2 instances and install docker engine via Terraform
### 2.2 Take public IP's and put in to inventory file anshosts.txt respectively
### 2.3 Put in public IP's in to runimage.yml, url: respectively 
### 2.4 Run tarcopyrun.sh file 
### 2.5 Check webpages availibility in web browser using both public IP's from Terraform output
 
