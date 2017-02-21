#!/bin/bash

useradd -o -m  $USER -u $UID
echo -e "$PASS\n$PASS" | passwd $USER
echo $PUBKEY > /home/$USER/.ssh/authorized_keys
mkdir /home/$USER/.ssh
touch /home/$USER/.ssh/authorized_keys
chown -R $USER.$USER /home/$USER
chmod 0700 /home/$USER/.ssh/authorized_keys
sed -i "s/'//g" /home/$USER/.ssh/authorized_keys
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
