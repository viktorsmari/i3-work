# Make /var/www editable by user. 
sudo adduser $(whoami)  www-data
sudo chown -R www-data:www-data /var/www
sudo chmod -R g+rwX /var/www
echo "You need to re-log in if for changes to take effect"
