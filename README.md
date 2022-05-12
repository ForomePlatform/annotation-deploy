# Deploy annotation service
## On local machine

Prerequisites:
- Linux machine on **Ubuntu 20.04**
- Installed [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu)
- About **350 Gb** free disk space at least
- `sudo` privileges

Clone repo:
```bash
git clone -b develop https://github.com/ForomePlatform/annotation-ibm.git annotation
cd annotation/ansible
```

Enable NOPASSWD for sudo group:
```bash
sudo sed -i -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/g' sudoers
```
Set MySQL user password:
```bash
export MYSQL_USER=mysql
export MYSQL_PASSWORD=mysql
```

Run ansible playbook:
```bash
ansible-playbook main.yml -i inventory_local
```

The process takes several hous. Be patient ...