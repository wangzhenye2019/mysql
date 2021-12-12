#!/bin/bash
user=root
passwd=rootroot
host=127.0.0.1


for i in `seq 1 20`
do
sql1=`mysql -u$user -p$passwd -h$host -e "drop database if exists itpux$i"`
echo "[info]第 $i 个数据库itpux$i 删除成功"
done
echo "-----------------------------------"
echo "共有$i 个数据库删除成功"