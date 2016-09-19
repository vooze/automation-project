#!/usr/bin/env bash
echo "Installing Apache + PHP5 and making symlink"
apt-get update >/dev/null 2>&1
apt-get install -y apache2 php5 php5-mysql git >/dev/null 2>&1
rm -rf /var/www/html
ln -fs /vagrant/vagrant-html /var/www/html
git clone https://github.com/vooze/automation-project
cp /home/vagrant/automation-project/vagrant/report_json.php /vagrant/vagrant-html
