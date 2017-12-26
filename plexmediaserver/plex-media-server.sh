sudo apt-get update
#sudo sed -i -e 's/# en_US.UTF-8 UTF-8/ en_US.UTF-8 UTF-8/g' /etc/locale.gen
#sudo locale-gen
sudo apt-get install -y apt-transport-https
wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key | sudo apt-key add -
echo "deb https://dev2day.de/pms/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/pms.list
sudo apt-get update
sudo apt-get install -y -t $(lsb_release -cs) plexmediaserver-installer
sudo sed -i -e 's/PLEX_MEDIA_SERVER_USER=plex/PLEX_MEDIA_SERVER_USER=pi/g' /etc/default/plexmediaserver.prev
sudo chown -R plex:plex /var/lib/plexmediaserver/
sudo service plexmediaserver restart
