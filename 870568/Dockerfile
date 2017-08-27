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

RUN \
 export DEBIAN_FRONTEND=noninteractive;apt-get update -y && apt-get install -y \
        vim \
	mysql-server 

RUN mkdir /var/run/mysqld;chown mysql.mysql /var/run/mysqld

WORKDIR /var/log/mysql
COPY mysqltest.sh .
RUN  sh mysqltest.sh
