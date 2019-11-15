#!/bin/bash

echo Copying files..
cp src/config/inotify-cho.conf /etc
cp src/script/inotify-cho.sh /usr/sbin
cp src/service/inotify-cho /etc/init.d

echo Making directories..
mkdir /var/log/inotify-cho

chown root:root /etc/inotify-cho.conf
chown root:root /usr/sbin/inotify-cho.sh
chown root:root /etc/init.d/inotify-cho
chown root:root /var/log/inotify-cho

echo Adding permissions..
chmod 644 /etc/inotify-cho.conf
chmod 755 /usr/sbin/inotify-cho.sh
chmod 755 /etc/init.d/inotify-cho
chmod 755 /var/log/inotify-cho

echo Adding service..
chkconfig --add /etc/init.d/inotify-cho
chkconfig --level 2345 inotify-cho on

service inotify-cho start
service inotify-cho status
