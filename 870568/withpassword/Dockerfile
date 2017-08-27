#*********************************************************************
#
# Dockerfile for https://serverfault.com/questions/870568/2017-08-26t113924-509100z-0-error-fatal-error-cant-open-and-lock-privilege
#
#*********************************************************************

# Ubuntu image
FROM ubuntu:16.04

# 
# Maintained by Wolfgang Fahl / BITPlan GmbH http://www.bitplan.com
# 
MAINTAINER Wolfgang Fahl info@bitplan.com

# set a default password - hoping we get better install result
RUN \
  echo 'mysql-server-5.7 mysql-server/root_password password root' | debconf-set-selections; \
  echo 'mysql-server-5.7 mysql-server/root_password_again password root' | debconf-set-selections

#RUN \
# export DEBIAN_FRONTEND=noninteractive;apt-get update -y && apt-get install -y \
#	mysql-server 
RUN \
  apt-get update -y && apt-get install -y \
	vim \ 
	mysql-server; \ 
  mkdir /var/run/mysqld;chown mysql /var/run/mysqld; \
  service mysql start; \
  mysql_upgrade --password=root
  
RUN mkdir /var/run/mysqld;chown mysql.mysql /var/run/mysqld

WORKDIR /var/log/mysql
COPY mysqltest.sh .
