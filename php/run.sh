#!/bin/bash

service php5.6-fpm start
service nginx start

/usr/sbin/sshd -D