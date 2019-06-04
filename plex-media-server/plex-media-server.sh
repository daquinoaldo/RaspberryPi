sudo apt update
sudo apt install -y apt-transport-https
wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key | sudo apt-key add -
echo "deb https://dev2day.de/pms/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/pms.list
sudo apt update
sudo apt install -y -t $(lsb_release -cs) plexmediaserver-installer
sudo sed -i -e 's/PLEX_MEDIA_SERVER_USER=plex/PLEX_MEDIA_SERVER_USER=pi/g' /etc/default/plexmediaserver.prev
sudo chown -R plex:plex /var/lib/plexmediaserver/
sudo service plexmediaserver restart