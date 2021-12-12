#!/bin/bash
user=root
passwd=rootroot
host=127.0.0.1

for i in `seq 1 20`
do
sql1=`mysql -u$user -p$passwd -h$host -e "set default_storage_engine=InnoDB;create database if not exists itpux$i DEFAULT CHARACTER SET UTF8mb4 DEFAULT COLLATE utf8mb4_general_ci;"`
echo "[info]第 $i 个数据库 itpux$i 创建成功"
done
echo "-----------------------------------"
echo "恭喜你：一共有 $i 个数据库已创建成功！"




