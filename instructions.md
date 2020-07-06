# Follow This Steps After Running installer.sh

#### Create A Directory on Your `C://` Drive Called `server/www`

### Edit Lines in `/etc/apache2/sites-available/000-default.conf`
```
DocumentRoot /mnt/c/server/www
```

### Edit Lines in `/etc/apache2/apache2.conf`
```
<Directory />
        Options Indexes FollowSymLinks Includes ExecCGI
        AllowOverride All
        Require all granted
</Directory>

```

### Add Lines to `~/.bashrc`
```
alias composer='composer.phar'
export PATH=$PATH:~/.config/composer/vendor
```

### Add Lines to `/etc/mysql/my.cnf`
```
[mysqld]
default_authentication_plugin = mysql_native_password
```

### Run Commands
```
$ sudo mysql
mysql> CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
mysql> GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
mysql> FLUSH PRIVILEGES;
mysql> exit

$ ln -s /usr/share/phpmyadmin /mnt/c/server/www/phpmyadmin

```
