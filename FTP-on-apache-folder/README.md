# FTP on the Apache folder
Have you setup an Apache server on linux (on your Raspberry Pi or on your VPS for example) but you can't upload files with FTP?  
Now we will see how to setup SFTP (FTP via SSH) to upload in the Apache folder (/var/www).

1. Create a new user for the FTP service.
  ```bash
  useradd -d /var/www ftp
  ```
2. Set a password for FTP.
  ```bash
  passwd ftp
  ```
3. Add the new user to www-data group and grant file and folder permissions.
  ```bash
  usermod -a -G www-data ftp
  chown -R root:www-data /var/www
  find /var/www -type d -exec chmod 2775 {} +
  find /var/www -type f -exec chmod 0664 {} +
  ```
4. Edit `/etc/profile`
  ```bash
  nano /etc/profile
  ```
  and add (or replace if already exist) this line.
  ```
  umask 0002
  ```
5. Reboot the Raspberry Pi to apply the changes.
  ```
  sudo reboot
  ```

Now you can use your favourite application, like the open source [Filezilla](https://fileZilla-project.org/), to upload via FTP your files directly into your apache web server.  
Follow this configuration:
- Connection type: SFTP / SSH File Transfer Protocol
- Authentication / Login type (where present): normal / classic (username and password)
- Username: ftp
- Password: the one you chose
- Port: 22 (leave default)