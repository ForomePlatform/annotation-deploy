# Deploy annotation service
## On local machine

### Prerequisites:
- Linux machine on **Ubuntu 20.04.4 LTS** (x86_64)
- Installed **ansible** (core 2.12.5)
- About **350 Gb** free disk space at least
- `sudo` privileges


### Deployment

Enable NOPASSWD for sudo group:
```bash
sudo sed -i -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers
```

Install ansible:
```bash
sudo apt update
sudo apt install python3-pip python3-dev
sudo pip install pip --upgrade
sudo pip install ansible==5.7.1
```

Check ansible version:
```bash
ansible --version
ansible [core 2.12.5]
  ...
  python version = 3.8.10 (default, Mar 15 2022, 12:22:08) [GCC 9.4.0]
  jinja version = 2.10.1
  libyaml = True
```

Clone repo:
```bash
git clone -b develop https://github.com/ForomePlatform/annotation-ibm.git deploy
cd deploy/ansible
```

Set MySQL user and password (user=`forome` and password=`forome` if not set):
```bash
export MYSQL_USER=mysql
export MYSQL_PASSWORD=mysql
```

Run ansible playbook:
```bash
ansible-playbook main.yml -i inventory_local
```

The process takes several hous. Be patient ...

Ansible playbook should end successfully without errors.

Final output wxample:
```bash
PLAY RECAP *****************************************************************************************************
localhost                  : ok=X   changed=X    unreachable=0    failed=0    skipped=X   rescued=0    ignored=1
```