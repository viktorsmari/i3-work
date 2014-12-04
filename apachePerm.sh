# Make /var/www editable by user. Takes user as parameter
sudo adduser $! www-data
sudo chown -R www-data:www-data /var/www
sudo chmod -R g+rw /var/www
