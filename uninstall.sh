#!/bin/bash

service inotify-cho stop 

echo Deleting service.. 
chkconfig inotify-cho off
chkconfig --del inotify-cho

echo Deleting files..
rm -f /etc/init.d/inotify-cho
rm -f /usr/sbin/inotify-cho.sh
rm -f /etc/inotify-cho.conf
rm -f /var/log/inotify-cho/inotify-cho.log
rm -f /var/log/inotify-cho/inotify-cho.err

echo Deleting directories..
rmdir /var/log/inotify-cho

echo Done
