#!/bin/bash

useradd -o -m  $USER -u $USERID
echo -e "$PASS\n$PASS" | passwd $USER
mkdir /home/$USER/.ssh/
echo $PUBKEY > /home/$USER/.ssh/authorized_keys
chown -R $USER.$USER /home/$USER
chmod 0700 /home/$USER/.ssh/authorized_keys
sed -i "s/'//g" /home/$USER/.ssh/authorized_keys
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
