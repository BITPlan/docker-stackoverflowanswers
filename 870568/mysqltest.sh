#!/bin/bash
#
# execute the given sql command
#
dosql() {
  local l_sql="$1"
  local l_db="$2"
  echo "$l_sql" | mysql -u root -p="$rootpass" $l_db
}

# get root password from the command line
rootpass="$1"

# start the mysql daemon
mysqld_safe --skip-grant-tables&
sleep 3
mysql_upgrade --password="$rootpass"
for table in $(dosql "show tables" mysql)
do
  for try in 1 2 3
  do
    sql="select count(*) from $table"
    echo "try #$try for $sql"
    dosql "$sql" mysql
  done
done
mysql_upgrade --password="$rootpass"
# kill daemon
echo "killing mysql daemon"
pkill -f mysqld
sleep 3
echo "starting mysql daemon via service"
service mysql start
grep ERROR error.log
exit 0
