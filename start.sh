#!/bin/bash

getent passwd $USER_NAME > /dev/null 2>&1
if [ $? -ne 0 ]; then
  useradd -m -o $USER_NAME -ou $USERID

  if [  -z "$PASS" ]; then       
	  echo passgen
	  PASS=`dd if=/dev/random bs=32 count=1 2> /dev/null | md5sum `
  fi

  echo -e "$PASS\n$PASS" | passwd $USER_NAME

  mkdir /home/$USER_NAME/.ssh
  echo $PUBKEY > /home/$USER_NAME/.ssh/authorized_keys && sed -i "s/'//g" /home/$USER_NAME/.ssh/authorized_keys
  chmod 0600 /home/$USER_NAME/.ssh/authorized_keys
  chown -R $USERID:$USERID /home/$USER_NAME
  echo PassivePorts $PORT_MIN $PORT_MAX >> /etc/proftpd/proftpd.conf
fi

/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

