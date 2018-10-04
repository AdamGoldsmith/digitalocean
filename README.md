DigitalOcean Jenkins Deployment
===============================

Uses Ansible to deploy the following
*	Terraform CentOS 7 DO droplet & load balancer instance
*	Create 4 Gb swap file on DO droplet
*	Enable epel repo on DO droplet
*	Install docker on DO droplet
*	Pull & start Jenkins JNLP Slave container

Currently tested on these Operating Systems
* CentOS 7

Requirements
------------

* Ansible 2.5 or higher
* Terraform
* DigitalOcean account
* Update DigitalOcean API token in `inv.d/host_vars/localhost/vault.yml`
* Update Jenkins URL & Jenkins slave secret variables in `inv.d/group_vars/do/vault.yml`

Dependencies
------------

* Requires elevated root privileges

Getting the code
----------------

`git clone https://github.com/AdamGoldsmith/digitalocean.git`

Getting the roles
-----------------

`ansible-galaxy install -r roles/requirements.yml`

Running the playbook
--------------------

__To deploy__

`ansible-playbook playbooks/site.yml`

__To destroy__

`ansible-playbook playbooks/site.yml -e 'state=absent'`

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

