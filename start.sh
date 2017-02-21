#!/bin/bash

getent passwd $USER > /dev/null 2>&1

if [ $? -ne 0 ]; then
useradd $USER -u $UID
echo -e "$PASS\n$PASS" | passwd $USER
mkdir /home/$USER
chown $USER.$USER /home/$USER
chmod 0700 /home/$USER
mkdir /home/$USER/.ssh
touch /home/$USER/.ssh/authorized_keys
chown -R $USER.$USER /home/$USER
chmod 0700 /home/$USER/.ssh/authorized_keys
echo $PUBKEY > /home/$USER/.ssh/authorized_keys
sed -i "s/'//g" /home/$USER/.ssh/authorized_keys
fi
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
