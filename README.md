Use this docker-compose file to start only sftp service.

``` 
zabbix-sftp:
  #image: casp/sftp-ftp
  build: ./sftp-ftp
  hostname: sftp-ftp
  container_name: sftp-ftp
  restart: always
  volumes:
     - /srv/docker/zabbix-server/alertscripts:/alertscripts
  ports:
     - "2213:22"
  environment:
     - USER_NAME=username
     - PASS=password
     - USERID=0
     - PUBKEY='ssh-rsa AAKS0qhFg9z5.............PFbtPTVtelJg06rY+7Ve4BprmYjM+Oo/Ltf0FBw== CASP1 +AND+ ssh-rsa AAAAB3Ni.............dsfa== CASP2 +AND+ ssh-rsa AAAAB3NzaC1y.......................nj6mCCtJR1OYcuRDkAOp9PT/ CASP3'
```
