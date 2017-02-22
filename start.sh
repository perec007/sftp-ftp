#!/bin/bash


if [ getent passwd $USER > /dev/null 2>&1 ]; then
  useradd -m -o $USER -ou $USERID
  echo -e "$PASS\n$PASS" | passwd $USER

  mkdir /home/$USER/.ssh
  echo $PUBKEY > /home/$USER/.ssh/authorized_keys
  chown -R $USER.$USER /home/$USER
  chmod 0600 /home/$USER/.ssh/authorized_keys

  sed -i "s/'//g" /home/$USER/.ssh/authorized_keys
fi

/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
