export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y mysql-server git php5-cli php5-mysql
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf
restart mysql
mysqladmin -u root password rootpass
mysql -uroot mysql --password=rootpass <<< "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'rootpass' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -uroot mysql --password=rootpass <<< "GRANT SELECT ON *.* TO 'read-user'@'%' IDENTIFIED BY 'Passw0rd';"
git clone https://github.com/vooze/automation-project
bash /home/vagrant/automation-project/bash-weather/create-database.sh
bash /home/vagrant/automation-project/bash-weather/weather.sh
(crontab -l 2>/dev/null; echo "10 * * * * bash /home/vagrant/automation-project/bash-weather/weather.sh") | crontab -
