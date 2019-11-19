#!/bin/bash

install_service()
{
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
}

uninstall_service()
{
    service inotify-cho stop 

    echo Removing service.. 
    chkconfig inotify-cho off
    chkconfig --del inotify-cho

    echo Removing files..
    rm -f /etc/init.d/inotify-cho
    rm -f /usr/sbin/inotify-cho.sh
    rm -f /etc/inotify-cho.conf
    rm -f /var/log/inotify-cho/inotify-cho.log
    rm -f /var/log/inotify-cho/inotify-cho.err

    echo Removing directories..
    rmdir /var/log/inotify-cho

    echo Done
}

reinstall_service()
{
    service inotify-cho stop 

    echo Removing service.. 
    chkconfig inotify-cho off
    chkconfig --del inotify-cho

    echo Removing files..
    rm -f /etc/init.d/inotify-cho
    rm -f /usr/sbin/inotify-cho.sh

    echo Copying files..
    cp src/script/inotify-cho.sh /usr/sbin
    cp src/service/inotify-cho /etc/init.d

    chown root:root /usr/sbin/inotify-cho.sh
    chown root:root /etc/init.d/inotify-cho

    echo Adding permissions..
    chmod 755 /usr/sbin/inotify-cho.sh
    chmod 755 /etc/init.d/inotify-cho

    echo Adding service..
    chkconfig --add /etc/init.d/inotify-cho
    chkconfig --level 2345 inotify-cho on

    service inotify-cho start
    service inotify-cho status
}

PS3='Enter option [1-3]: '

select option in Install Uninstall Reinstall Quit 
do
    case $option in
        "Install")
            echo "Installing.."
            install_service
            break
            ;;
        "Uninstall")
            echo "Uninstalling.."
            uninstall_service
            break
            ;;
        "Reinstall")
            echo "Reinstalling.."
            reinstall_service
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option: $REPLY";;
    esac
done
